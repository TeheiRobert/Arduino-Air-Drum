class Note {
  int pos;
  float delta;
  boolean finished = false;
  AudioPlayer sound;
  AudioPlayer sound2 = null;
  
  int r = 0;
  int g = 193;
  int b = 200;
  
  Note() {
    pos = 0;
    delta = 5;
  }
  
  Note(int position) {
    this.pos = position;
  }
  
  Note(int position, char c) {
   this.pos = position;
   if(position == 5) {
    pos = 1;
    r = 255;
    g= 0;
    b=0;
   }
   switch(c) {
    case 'h': this.sound = openHat;
         this.sound2 = closedHat;
      break;
      
      case 'b': this.sound = bass;
      break;
      
      case 'c': this.sound = crash;
      break;
      
      case 's': this.sound = snare;
      break;
      
      case 't': this.sound = tom;
      break;
   }
}
  
  void draw() {
    fill(r,g,b);
    //delay(5);
    rect(30+200*pos, delta,140,40,6);
    delta = delta + 6.0f;
    if (delta > 950) {
       finished = true; 
       delta = 1000;
    }
  } 
  
  
  
  float getDelta() {
    return this.delta;
  }
  
  AudioPlayer getSound() {
    if(this.sound2 == null) {
   return this.sound; 
    } else {
     if(closedHiHatBool) {
      return this.sound; 
     } else {
      return this.sound2; 
     }
    }
  }
  
  int getScore() {
    return 100 - abs((int)this.delta - 900);
  }
  
  void done() {
    r = 255;
    g = 0;
    b = 255;
    
   finished = true; 
  }
  boolean isFinished() {
   return finished;   
  }
}  