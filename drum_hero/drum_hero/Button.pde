class Button {
  int pos;
  boolean pressed = false;
  int col = 52;
  int pressTime = 0;

  void draw() {
    noStroke();
    fill(col, 123, 237);
    if(pressed == false) {
      rect(20+200*pos,900,160,50,7);
    } else {
      pressTime = pressTime +1;
       rect(30+200*pos,910,140,40,6); 
       if(pressTime == 6) {
        pressTime = 0;
        pressed = false;
       }
    }
  }
  
  Button(int position) {
    this.pos = position;
  }
  
  void pressed() {
    pressed = true;
  }
  
  void setColor(boolean set) {
   if(set) {
     col = 255;
   } else {
     col = 42;
   }
  }
}