import ddf.minim.*;
import processing.serial.*;


Serial port;
int drumDelay;
int score;

boolean start = false;
boolean startDrums = false;
boolean started = false;
boolean enter = false;
boolean finished = false;

Minim minim;
AudioPlayer closedHat;
AudioPlayer openHat;
AudioPlayer snare;
AudioPlayer crash;
AudioPlayer bass;
AudioPlayer tom;
AudioPlayer song;


Lane[] lanes = new Lane[3];

boolean minButton = false;
Button[] buttons = new Button[3];
Note n = new Note(0);
Master m = new Master();
float delay;
int tZero;

int noteDelay;

void setup() {
  size(600, 1000);
  background(100,0,100);
  noStroke();
  fill(102);
  printArray(Serial.list());
  
  initLanes();
  initPlayers();

  port = new Serial(this, "COM2", 9600);  //hardcoded - must change to
  port.buffer(1);
 
  
  
 
}

void draw() {
  background(100,0,100);
  fill(52, 123, 237);
  
  if(finished) {
    showScore();
  } else if(enter) {
  playGame();
  } else {
    welcomeScreen();  
  }
}
 
     
 
 
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 void showScore() {
    textSize(90);
    fill(0, 102, 153);
    text(str(score), 200, 500);
 }
 
 void playGame() {
   drawDelimiters();
  drawButtons();
  drawLanes();
  newNote();
  startSong();
 }
 
 void welcomeScreen() {
   textSize(90);
    fill(0, 102, 153);
    text("Drum", 200, 500);
    fill(0, 102, 153, 51);
    text("HERO", 200, 600);
 }
 void startSong() {
   if(start && !started) {
     drumDelay = millis();
     song.play();
     started = true;
   }
   //8550 for Metallica
   //5300 for MetallicaDrumless
   if(millis() - drumDelay > 8550 && start) {
    startDrums = true; 
    start = false;
   }
 }

void drawDelimiters() {
   stroke(229, 45, 45);
   strokeWeight(4);
   for(int i = 1; i < 3; i++) {
     line(200*i,0,200*i,1000);
   }
}

void newNote() {
  if((startDrums) && (millis() - tZero >= delay)) {
  delay = m.play();
  tZero = millis();
  }
}

void drawLanes() {
  for(int i = 0; i < 3; i++) {
   lanes[i].draw(); 
  }
}
  