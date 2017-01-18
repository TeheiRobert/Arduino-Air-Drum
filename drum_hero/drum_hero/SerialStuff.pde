
void serialEvent(Serial port) {
  boolean ok = true;

  try {
   int val = port.read();
   
   print(val);
   
   if(val == 1) {
     ok = lanes[0].playNote();
     if(!ok) {
       lanes[0].playWrongNote(bass);
    }
   }
   
   if(val == 2) {
     ok = lanes[2].playNote();
     if(!ok) {
       lanes[2].playWrongNote(openHat);
    }
   }
   if(val == 51) {
    ok = lanes[1].playNote();
    if(! ok) {
      lanes[1].playWrongNote(snare);
    }
   }
  }
  catch(RuntimeException e) {
    e.printStackTrace();
  }
  //port.write(1);

}