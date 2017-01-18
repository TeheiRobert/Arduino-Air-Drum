class Lane {
  
 Note[] notes = new Note[20];
 int length = 0;
 Button button;
 
 
 
 void draw() {
  for(int i = 0; i < length; i++) {
    notes[i].draw();
    if(notes[i].isFinished()) {
      score = score + notes[i].getScore();
      resetArray(i);
    }
  }
 }
 
 boolean playNote() {

   Note n = getFirstNote();
   

   if(n != null) {
     AudioPlayer s = n.getSound();
     s.rewind();
     s.play();
     n.done();
     pressedButton();
     return true;
     
   } else {

     pressedButton();

     return false;
   }
 }
 
 void addNote(int pos, char c) {
  Note n = new Note(pos, c);
  notes[length] = n;
  length = length+1;
 }  
 
 Note getFirstNote() {

   if(length > 0) {
     if(notes[0].getDelta() < 800) {
       return null;
     } else {
      return notes[0];
     }
   } else {

     return null; 
   }
 }
 
 void playWrongNote(AudioPlayer p) {
   p.rewind();
   p.play();
   pressedButton();
 }
 
 void setButton(Button b) {
   this.button = b;
 } 
 
 void pressedButton() {

   this.button.pressed(); 

 }
 
 void changeButtonMode(boolean val) {
   this.button.setColor(val);
 }
 void resetArray(int index) {
   for(int i = index; i < length - 1; i++) {
     notes[i] = notes[i+1];
   }
   notes[length] = null;
   length = length - 1;
 }
}