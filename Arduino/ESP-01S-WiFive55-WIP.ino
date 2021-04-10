/*
    (C) Copyright 2021 Phill Rogers.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/*
 * 2021-01-21  Phill
 * Notes:
 * KeyWords for initials: Rising/Falling, High/Low, Charge/Discharge, Powered/Unpowered
 * Sketch: ESP-01S_WiFive55_WebSock-IO to be run on an ESP-01/S
 * 
 * SoFar:
 * RLA is asctive low.  BTN is active low.
 * rename pin/functions: INPUT & OUTPUT, TRIGGER & OUTPUT, BUTTON & RELAY, BTN & RLA ? 
 * consistent order & case: object_attribute - btn_pin, btn_state, checkSwitch -> btn_check
 * Tidy white space
 * Get Date/Time from browser "Wed Jan 13 2021 20:10:23 GMT+0000 (Greenwich Mean Time)"
 * Date in ISO
 * Start up state should be off.
 * No need for Bounce2 lib as the hardware delay does de-bounce.
 * throb builtin LED at boot to show when to press for config.
 * Two modes but not yet selecting
 * Get mode from device.
 * Send mode request to device.  
 * mode of operation selection by GUI
 * time-delay mode: hard-coded 2s falling edge trigger
 * time-interval mode with editable mS
 * oscillate mode (as fast as possible)
 * burst mode, using rising edge
 * pulse-pause-pulse
 * Version in GUI
 * add numbers to table to show mode number when selecting by button.
 * add place-holder for Sweep, fade-on, fade-off.  fix startup timing, tidy code.
 * on GUI start, get mode from dev to gui
 * add count-down for long timers
 * add ON & OFF button for instant action, clearing current timeouts
 * Measure, with time-out in case RLA not wored to BTN
 * Config mode if btn was changed & returned during the throb. Allows for Normally Closed builds.
 * show responce times in GUI atr start.
 * 
 * ToDo:
 * version not showing on iOS but OK in Chrome.
 * How to get touch interface to not select nearby text when trigger button is held?
 * d & l mode for rising edge?
 * on GUI start, get date from gui to dev
 * Get Date/Time to device at start up
 * Browser to show time of last press?
 * mode of operation selection by BTN
 * SPIFFS lib to save settings, log
 * image files for web service?
 * OTA update?
 */

#include <ESP8266WiFi.h>
#include <WebSocketsServer.h>
#define margin 1.1
WiFiServer server(80);
WebSocketsServer webSocket = WebSocketsServer(81);
char ssid[] = "F7SHC_optout" ;
char pass[] = "jzyfjxxi" ;
byte led_pin = 1; // shared with serial TX
byte btn_pin = 0;
byte rla_pin = 2;
char mo_now[] = "T";
boolean btn_sim = HIGH;
boolean btn_state = HIGH;
boolean rla_state = HIGH;
boolean btn_prev = HIGH;
char *ptr, buf[256];
boolean mo_b_prev = HIGH;
/* following taken exactly from auto measure function */
unsigned long long_charge = 45L;
unsigned long short_discharge = 8L;
unsigned long short_charge = 7L;
unsigned long long_discharge = 98L;
unsigned long countdown_prev = 0L;
unsigned long time_last_sent_on = 0L;
unsigned long time_last_sent_off = 0L;
unsigned long time_last_here = 0L;
unsigned long time_out1 = 0L;
unsigned long time_out2 = 0L;
unsigned long time_out3 = 0L;
unsigned long time_delay1 = 200L;
unsigned long time_delay2 = 600L;
unsigned long time_delay3 = 3000L;

String index_htm = R"=index=(
<!DOCTYPE html><html><head>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'/>
  <meta charset='utf-8'/>
  <style>
    body     { font-size:120%; -webkit-touch-callout: none; -webkit-user-select: none; }
    #main    { display:table; width:320px; margin:auto; padding:10px 10px 10px 10px; 
               border:3px solid blue; border-radius:10px; text-align:center; } 
    #BTN_TRG { width:180px; height:40px; font-size:110%; }
    p        { font-size:75%; }
    .c3      { text-align:left; }
    .c4      { text-align:right; padding-left: 18px; }
    h3       { padding: 0px; margin: 0px; }
    h6       { padding: 0px; margin: 0px; }
    table    { margin-left: auto; margin-right: auto; }
    button   { -webkit-touch-callout: none; -webkit-user-select: none; }
  </style>
  <title>WiFive55 - timer toolbox</title>
</head>
<body><div id='main'><h3>WiFive55</h3><h6>Timer Toolbox</h6><div id='content'>
  <p>OUTPUT:&nbsp;<span id='RLA_status'>Unpowered</span></p>
  <button name="RST" id='rst_off' class='button' onclick='rst(this);' >OFF</button>&nbsp;
  <button id='BTN_TRG' class='button'>TRIGGER</button>&nbsp;
  <button name="RST" id='rst_on' class='button' onclick='rst(this);' >ON</button><br/>
  <p>Timer 1:&nbsp;<input type='number' id='t1' name='td' min="0" value="" onchange='td_req(this);'></p>
  <p>Timer 2:&nbsp;<input type='number' id='t2' name='td' min="0" value="" onchange='td_req(this);'></p>
  <p>Timer 3:&nbsp;<input type='number' id='t3' name='td' min="0" value="" onchange='td_req(this);'></p>
  <p>Date/Time: <span id='dt'>---</span></p>
  <p>Timeout: <span id='rd'>---</span></p>
  <p>Version: <span id='vn'>---</span></p>
  <table>
    <tr><td>1</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_F' value='F'></td>
      <td class='c3'>Follow</td><td class='c4'>F,P,R,U</td></tr>
    <tr><td>2</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_T' value='T'></td>
      <td class='c3'>Toggle</td><td class='c4'>F,P,F,U</td></tr>
    <tr><td>3</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_I' value='I'></td>
      <td class='c3'>Interval-on</td><td class='c4'>F,P,T1,U</td></tr>
    <tr><td>4</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_D' value='D'></td>
      <td class='c3'>Delay-on</td><td class='c4'>F,T2,P</td></tr>
    <tr><td>5</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_P' value='P'></td>
      <td class='c3'>PulsePausePulse</td><td class='c4'>F,P,T1,U,T2,P,T3,U</td></tr>
    <tr><td>6</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_B' value='B'></td>
      <td class='c3'>Burst</td><td class='c4'>R,[P,T1,U,T2]T3</td></tr>
    <tr><td>7</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_O' value='O'></td>
      <td class='c3'>Oscillate</td><td class='c4'>[P,T1,U,T2]</td></tr>
    <tr><td>8</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_M' value='M'></td>
      <td class='c3'>Measure</td><td class='c4'>..5s..P,Tlc?,U,Tsd?,P,sc?..5s..U,ld?</td></tr>
    <tr><td>10</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_S' value='S'></td>
      <td class='c3'>Sweep</td><td class='c4'>F,[[P,T1/2,U,T1/2]...<br/>[P,T2/2,U,T2/2]]T3</td></tr>
    <tr><td>11</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_A' value='A'></td>
      <td class='c3'>Accelerando</td><td class='c4'>F,[[P,T2-T1,U,T2]...<br/>[P,T1,U,T2]]T3,P</td></tr>
    <tr><td>12</td><td><input type='radio' name='mo_sel' onclick='mo_req(this);' id='mo_R' value='R'></td>
      <td class='c3'>Ritardando</td><td class='c4'>F,[[P,T1,U,T2]...<br/>[P,T2-T1,U,T2]]T3,U</td></tr>
  </table>
</div></div></body>
<script>
var Socket;
var currentTime = new Date();
function sendText(data) { Socket.send(data); }
document.getElementById('dt').innerHTML = currentTime.toISOString(); // sendText(currentTime);
function init() {
  Socket = new WebSocket('ws://' + window.location.hostname + ':81/');
  Socket.onmessage = function(event) { processReceivedCommand(event); };
}
function processReceivedCommand(evt) {
  if(evt.data === '1') {
    document.getElementById('RLA_status').innerHTML = 'Unpowered';
    document.getElementById('RLA_status').style.backgroundColor = 'LightGreen';
  } else
  if(evt.data === '0') {
    document.getElementById('RLA_status').innerHTML = 'Powered';
    document.getElementById('RLA_status').style.backgroundColor = 'Red';
  } else
  if(evt.data[0] == 'v') {
    document.getElementById('vn').innerHTML = evt.data;
  } else
  if(evt.data[0] == '@') {
    num = evt.data.substring(4);
    if(evt.data[2]=='1'){document.getElementById('t1').value=num}
    if(evt.data[2]=='2'){document.getElementById('t2').value=num}
    if(evt.data[2]=='3'){document.getElementById('t3').value=num}
  }
  else
  if(evt.data[0] == ' ') {
    if(evt.data[1] == ' ') { document.getElementById('rd').innerHTML = ''; }
    else { document.getElementById('rd').innerHTML = evt.data; }
  }  
  else
  if((evt.data[0] >= 'A') && (evt.data[0] <= 'Z')) {
    document.getElementById('mo_'+evt.data[0]).checked = true;
  }
}
document.getElementById('BTN_TRG').addEventListener('mousedown', btn_down);
function btn_down() { sendText('0'); }
document.getElementById('BTN_TRG').addEventListener('mouseup', btn_up);
function btn_up() { sendText('1'); }
function mo_req(mo_radio) { sendText(mo_radio.value);}
function rst(rst_btn) { sendText(rst_btn.id);}
function td_req(td_num) { sendText('@'+td_num.id+' '+td_num.value);}
window.onload = function(e) { init(); }
</script>
</html>
)=index=";
String header = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n";

void webSocketEvent(byte num, WStype_t type, uint8_t * payload, size_t length) {
  if(type == WStype_TEXT) {
    if ( (payload[0] >= 'A') && (payload[0] <= 'Z') ) {
      mo_now[0] = payload[0];
      time_out1 = time_out2 = time_out3 = 0;
    }
    else if (payload[0] == '0') { btn_sim = LOW; }
    else if (payload[0] == '1') { btn_sim = HIGH; }
    else if (payload[0] == '@') {
      for(int i=4; i<length; i++) { buf[i-4] = (char)payload[i]; }
      if(payload[2] == '1') { sscanf(buf, "%lu", &time_delay1); }
      if(payload[2] == '2') { sscanf(buf, "%lu", &time_delay2); }
      if(payload[2] == '3') { sscanf(buf, "%lu", &time_delay3); }
      memset(buf, 0, sizeof(buf));
    }
    else if (payload[0] == 'r') {
      time_out1 = time_out2 = time_out3 = 0;
      if(payload[5] == 'n') { rla_on(); }
      if(payload[5] == 'f') { rla_off(); }
    }
  }
  else {
    Serial.print("WStype = "); Serial.println(type);
    Serial.print("WS payload = ");
    for(int i=0; i<length; i++) { Serial.print((char) payload[i]); }
    Serial.println();
  }
}

void rla_on() {
  unsigned long since=millis() - time_last_sent_off;
  rla_state = LOW;
  log("RLA=on");
  webSocket.broadcastTXT("0");
  if(since < short_discharge) {
    delay(short_charge - since);
  } else if(since < long_discharge) {
      delay(long_charge - since);
    }
  digitalWrite(rla_pin, LOW);
  time_last_sent_on = millis();
}
void rla_off() {
  unsigned long since=millis() - time_last_sent_off;
  rla_state = HIGH;
  log("RLA=off");
  webSocket.broadcastTXT("1");
  if(since < short_charge) {
    delay(short_discharge - since);
  } else if(since < long_charge) {
      delay(long_discharge - since);
    }
  digitalWrite(rla_pin, HIGH);
  time_last_sent_off = millis();
}
void log(char *msg) {
  Serial.println(msg);
}

boolean throb(int reps) {
#define BRIGHT    350     //max led intensity (1-500)
#define INHALE    1250    //Inhalation time in milliseconds.
#define PULSE     INHALE*1000/BRIGHT
#define REST      1000    //Rest Between Inhalations.
  boolean btn_pushed = false;
  boolean btn_before = btn_state;
  pinMode(led_pin, OUTPUT);
  for(; reps>0; reps--) {
    for (int i=1;i<BRIGHT;i++){     // ramp up, Inhalation:
      digitalWrite(led_pin, LOW);      // turn the LED on.
      delayMicroseconds(i*10);         // wait
      digitalWrite(led_pin, HIGH);     // turn the LED off.
      delayMicroseconds(PULSE-i*10);   // wait
      delay(0);                        // to prevent watchdog firing.
      if(digitalRead(btn_pin) != btn_before) { btn_pushed = true; }
    }
    for (int i=BRIGHT-1;i>0;i--){   // ramp down, Exhalation (half time):
      digitalWrite(led_pin, LOW);      // turn the LED on.
      delayMicroseconds(i*10);         // wait
      digitalWrite(led_pin, HIGH);     // turn the LED off.
      delayMicroseconds(PULSE-i*10);   // wait
      i--;
      if(digitalRead(btn_pin) != btn_before) { btn_pushed = true; }
      delay(0);                        // to prevent watchdog firing.
    }
    if(reps >1) { delay(REST); }       //take a rest...
  }
  pinMode(led_pin, INPUT);
 if(digitalRead(btn_pin) != btn_before) { btn_pushed = false; }
 return(btn_pushed);
}

void measure() {
  unsigned long start_time = 0L;
  unsigned long long_charge = 0L;
  unsigned long short_discharge = 0L;
  unsigned long short_charge = 0L;
  unsigned long final_time = 0L;
  unsigned long long_discharge = 0L;
  char *ptr;
  digitalWrite(rla_pin, HIGH);
  time_out3 = millis() + 5000; while(millis() < time_out3) { delay(10); }
  time_out3 = millis() + 2000;
  start_time = millis();
  digitalWrite(rla_pin, LOW);
  while(digitalRead(btn_pin) == HIGH) { delay(1); if(millis() >= time_out3) { break; } }
  long_charge = millis();
  digitalWrite(rla_pin, HIGH);
  delay(7);
  time_out3 = millis() + 2000;
  while(digitalRead(btn_pin) == LOW) { delay(1); if(millis() >= time_out3) { break; } }
  short_discharge = millis();
  digitalWrite(rla_pin, LOW);
  delay(7);
  time_out3 = millis() + 2000;
  while(digitalRead(btn_pin) == HIGH) { delay(1); if(millis() >= time_out3) { break; } }
  short_charge = millis();
  time_out3 = millis() + 5000; while(millis() < time_out3) { delay(10); }
  time_out3 = millis() + 2000;
  final_time = millis();
  digitalWrite(rla_pin, HIGH);
  while(digitalRead(btn_pin) == LOW) { delay(1); if(millis() >= time_out3) { break; } }
  long_discharge = millis();
  digitalWrite(rla_pin, HIGH);
  time_out3 = 0L;
  memset(buf, 0, sizeof(buf));
  ptr = buf + strlen(buf); sprintf(ptr, " lc:%04lu", long_charge - start_time );
  ptr = buf + strlen(buf); sprintf(ptr, " sd:%04lu", short_discharge - long_charge  );
  ptr = buf + strlen(buf); sprintf(ptr, " sc:%04lu", short_charge - short_discharge );
  ptr = buf + strlen(buf); sprintf(ptr, " ld:%04lu", long_discharge - final_time );
}

void setup() {
  pinMode(rla_pin, OUTPUT);
  digitalWrite(rla_pin, rla_state);
  pinMode(btn_pin, INPUT_PULLUP);
  memset(buf, 0, sizeof(buf));
  if(throb(2)) { mo_now[0] = 'C'; }
  Serial.begin(115200);
  log("\nSerial started at 115200");
  if( mo_now[0] == 'C') {
    log("Config was requested. Please reset.");
  } // Config

  // Connect to a WiFi network
  Serial.print(F("Connecting to ")); Serial.println("ssid");
  WiFi.begin(ssid,pass);
  // connection with timeout
  int count = 0; 
  while ( (WiFi.status() != WL_CONNECTED) && count < 17) {
    Serial.print("."); delay(500); count++;
  }
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println(""); Serial.print("Failed to connect to "); Serial.println(ssid);
    while(1);
  }

  Serial.println("");
  Serial.println(F("[CONNECTED]")); Serial.print(" http://"); Serial.print(WiFi.localIP());
  Serial.println("/ ");
  server.begin();
  Serial.println("Server started");
  webSocket.begin();
  webSocket.onEvent(webSocketEvent);
  // cannot send websocket text til there is a client listening.

  long_charge = ceil(long_charge * margin);
  short_discharge = ceil(short_discharge * margin);
  short_charge = ceil(short_charge * margin);
  long_discharge = ceil(long_discharge * margin);
}

void loop() {
  btn_state = (btn_sim && digitalRead(btn_pin));
  action();
  if(time_out3 >= 1000) {
    unsigned long countdown = 1+ceil((time_out3-millis())/1000);
    if(countdown != countdown_prev) {
      sprintf(buf," %lu", countdown); webSocket.broadcastTXT(buf);
      countdown_prev = countdown;
    }
  }
  webSocket.loop();
  WiFiClient client = server.available(); // Check if a client has connected
  if (!client) { return; }
  client.flush();
  client.print( header );
  client.print( index_htm ); delay(100); // depends on page complexity >= 5
  sprintf(buf, "@t1 %lu", time_delay1); webSocket.broadcastTXT(buf); memset(buf, 0, sizeof(buf));
  sprintf(buf, "@t2 %lu", time_delay2); webSocket.broadcastTXT(buf); memset(buf, 0, sizeof(buf));
  sprintf(buf, "@t3 %lu", time_delay3); webSocket.broadcastTXT(buf); memset(buf, 0, sizeof(buf));
  ptr = buf + strlen(buf); sprintf(ptr, " lc:%04lu", long_charge );
  ptr = buf + strlen(buf); sprintf(ptr, " sd:%04lu", short_discharge );
  ptr = buf + strlen(buf); sprintf(ptr, " sc:%04lu", short_charge );
  ptr = buf + strlen(buf); sprintf(ptr, " ld:%04lu", long_discharge );
  webSocket.broadcastTXT(buf); memset(buf, 0, sizeof(buf));
  webSocket.broadcastTXT(mo_now); webSocket.broadcastTXT("v20210131");
  log("New page served");
}

void action() {
  if(btn_state != btn_prev) { // Edge
    if( mo_now[0] == 'F' ) {
      if( btn_state == LOW ) { rla_on(); } else { rla_off(); }
    } // Follow
    if(btn_state == LOW) { // Falling Edge
      if(mo_now[0] == 'T') {
        mo_b_prev = ! mo_b_prev;
        if( mo_b_prev == LOW ) { rla_on(); } else { rla_off(); }
      } // Toggle
      if(mo_now[0] == 'I') {
        rla_on();
        time_out3 = millis() + time_delay1;
        sprintf(buf," %lu", time_delay1/1000); webSocket.broadcastTXT(buf);
      } // Interval-on: F,P,T1,U
      if(mo_now[0] == 'D') {
        time_out3 = millis() + time_delay2;
        sprintf(buf," %lu", time_delay2/1000); webSocket.broadcastTXT(buf);
      } // Delay: F,T2,P
      if(mo_now[0] == 'P') {
        sprintf(buf," %lu", (time_delay1+time_delay2+time_delay3)/1000); webSocket.broadcastTXT(buf);
        rla_on(); delay(time_delay1);
        rla_off(); delay(time_delay2);
        rla_on(); delay(time_delay3);
        rla_off(); delay(0);
        webSocket.broadcastTXT("  ");
      } // PulsePausePulse: F,P,T1,U,T2,P,T3,U
      if(mo_now[0] == 'S') {
        time_out3 = millis() + time_delay3;
        time_out1 = time_delay1 / 2;
        time_out2 = abs((time_delay3 / (time_delay2 - time_delay1))/2) ;
        time_last_here = millis();
        sprintf(buf," %lu", time_delay3/1000); webSocket.broadcastTXT(buf); memset(buf, 0, sizeof(buf));
      } // Sweep F,[[P,T1,U,T1]..[P,T2,U,T2]]T3
    } else { // Rising Edge
      if( mo_now[0] == 'B' ) {
        sprintf(buf," %lu", time_delay3/1000); webSocket.broadcastTXT(buf); memset(buf, 0, sizeof(buf));
        unsigned int count = 0;
        time_out3 = millis() + time_delay3;
        while(millis() < time_out3) { count++;
          rla_on(); delay(time_delay1);
          rla_off(); delay(time_delay2);
        }
        time_out3 = 0L;
        sprintf(buf, " Count: %u", count);
        log(buf);
        webSocket.broadcastTXT(buf); memset(buf, 0, sizeof(buf));
      } // Burst:R,[P,T1,U,T2]T3
      if( mo_now[0] == 'A' ) {
        time_out3 = millis() + time_delay3;
        time_out2 = time_delay3 / 10;
        log("WIP A");
      } // Accelerando F,[[P,T2-T1,U,T2]...[P,T1,U,T2]]T3,P
      if( mo_now[0] == 'R' ) {
        log("NYI");
        rla_off();
      } // Ritardando F,[[P,T1,U,T2]...[P,T2-T1,U,T2]]T3,U
    }
    btn_prev = btn_state;
  }
  if(time_out3 > 0) { // Long Timed
    if(mo_now[0] == 'I') {
      if(millis() >= time_out3) { rla_off(); time_out3 = 0L; webSocket.broadcastTXT("  "); }
    } // Interval-on: F,P,T1,U
    if(mo_now[0] == 'D') {
      if(millis() >= time_out3) { rla_on(); time_out3 = 0L; webSocket.broadcastTXT("  "); }
    } // Delay-on: F,T2,P
    if(mo_now[0] == 'S') {
      if(millis() >= time_out3) { rla_off(); time_out3 = 0L; webSocket.broadcastTXT("  "); } else {
        if(millis() >= (time_last_here + time_out2) ) {
          if(time_delay1 > time_delay2) { time_out1-=time_out2; } else { time_out1+=time_out2; }
          time_last_here = millis();
        }
        if(millis() >= (time_last_here + time_out1) ) {
          if(rla_state == LOW) { rla_on(); } else { rla_off(); }
        }
      }
    }
    if(millis() >= time_out3) { rla_off(); time_out3 = 0L; webSocket.broadcastTXT("  "); } else {
      if(mo_now[0] == 'A') {
        int pc = (millis() - time_out3) / time_delay3; // time remaining as percentage of overall duration
        if(pc < 50) {
          time_out1 = (10 * (100 - pc))/pc ; // off time
          rla_on(); delay(10);
          rla_off(); delay(time_delay1);
        }
        if(pc = 50) {
          rla_on(); delay(50);
          rla_off(); delay(50);
        }
        if(pc > 50) {
          time_out1 = (10 * pc)/(100-pc) ; // on time
          rla_on(); delay(time_out1);
          rla_off(); delay(10);
        }
      }
    } // Accelerando F,[[P,T2-T1,U,T2]...[P,T1,U,T2]]T3,P
  } else { // Forever
    if( mo_now[0] == 'O' ) {
      rla_state = ! rla_state;
      if(rla_state == LOW) {
        rla_on(); delay(time_delay1);
      } else {
        rla_off(); delay(time_delay2);
      }
    } // Oscillate:[P,T1,U,T2]
    if( mo_now[0] == 'M' ) {
      log("Automatically measuring charge & discharge times.");
      measure(); log(buf); webSocket.broadcastTXT(buf);
    } // Measure ..5s..P,Tlc?,U,Tsd?,P,sc?..5s..U,ld?
  }
}
