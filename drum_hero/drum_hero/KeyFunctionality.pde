boolean closedHiHatBool;

void keyPressed() {
  
  boolean ok = true;
  
  if(key == 'z' || key == 'Z') {
    ok = lanes[0].playNote();
    if(!ok) {
      if(closedHiHatBool) {
       lanes[0].playWrongNote(openHat);
      } else {
        lanes[0].playWrongNote(closedHat);
    }
    }
  }
  
  if(key == 'x' || key == 'X') {
    ok = lanes[1].playNote();
     if(!ok) {
       lanes[1].playWrongNote(bass);
    }
  }
  
  if(key == 'c' || key == 'C') { //<>//
    ok = lanes[2].playNote();
    if(! ok) {
      lanes[2].playWrongNote(crash);
    }
  }
  
  if(key == ' ') {
     closedHiHatBool = true;
     lanes[0].changeButtonMode(closedHiHatBool);
  }
  if(key == 'f') {
      finished = true;
      enter = false;
      start = false;
      song.pause();
      port.stop();
  }
  if(key == 's') {
      start = true;
  }
  if(keyCode == ENTER) {
   enter = true; 
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////




void initLanes(){
 for(int i = 0; i< 3; i++) {
  buttons[i] = new Button(i);
  lanes[i] = new Lane();
  lanes[i].setButton(buttons[i]);
 }

}

void drawButtons() {
 for(int i = 0; i<3; i++) {
  buttons[i].draw(); 
 }
}