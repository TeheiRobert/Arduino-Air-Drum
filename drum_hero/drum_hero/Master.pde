class Master {
 
  int index = 0;

  //i'm sorry
  //god knows what is here, my colleague wrote all of this.
  //it's basically the drum tab for metallica when the bell tolls 
  //it's his custom way of intrepreting it and generating falling "sound notes".
  String file1 = "t0b1t3b0t1t3c0b4b4b4b4b4b4";
  String file2 = "t0b1t3t0b1t1c0b4h0s4h0b4h0s4h0b4h0s4h0b4h0s2b2h0b4c0s4h0b4h0s4h0b4h0s4h0b4h0s2b2"; 
  String file3 = "h0b4c0s4h0b4h0s4h0b4h0s4h0b4h0s2b2h0b4c0s4h0b4h0s2s2s1t2t4s1s1s1t1t4";
  String file4 = "c0b4h0s4h0b4h0s4h0b4h0s4h0b4h0s2b2h0b4c0s4h0b4h0s4h0b4h0s4h0b4h0s2b1";
  
  String file5 = "h0b4c0s4h0b4h0s4h0b4h0s4h0b4h0s2b2h0b4c0s4h0b4h0s4c0b2b2b2b2s2t2t2t2";
  
  String file6 = "c0b4h0s4h0b4h0s4h0b3h0s3h0b4h0b3c0s1";
  String file7 = "h0b4h0s4h0b4h0s4h0b4h0s4h0b4h0b3c0G1";
  String file8 = "c0b3h0s4h0b4h0s3h0b4h0s4h0b4h0s4c0b4h0s4h0b4h0s4h0b4h0s4h0b4h0G4";
  
  
  
  //something wrong here
  String file9 = "c0b4h0s4h0b4h0s4s1t1t1t1s0c4s1t1t1t1s0c4";
  
  
  String file10 = "c0b4h0s4h0b4h0s4h0b2b1b1c0s4h0b2b1b1c0G4c0b4h0s4h0b4h0s4h0b4h0s4h0b4h0s4";
  
  String file = file1 + file1 + file1 + file1 + file2 + file3 + file4 + file5 + file6 + file7 + file8;
  
  Master() {}
  
  Master(String f) {
    this.file = f;
  }
  
  float play() {
   if(index < file.length()) {
     
     switch(file.charAt(index)) {
      case 'h': 
      lanes[0].addNote(0,'h');
      break;
      
      case 'H': 
      lanes[0].addNote(0,'H');
      break;
      
      case 'b':
      lanes[1].addNote(1,'b');
      break;
      
      case 'c':
      lanes[2].addNote(2,'c');
      break;
      
      case 'G': 
      lanes[1].addNote(5,'s');
      break;
      
      case 's':
      lanes[1].addNote(1,'s');
      break;
      
      case 't': 
      lanes[2].addNote(2,'t');
      break;
      case 'T': 
      lanes[2].addNote(5,'t');
      break;
      
      case 'p': 
      break;
      
      default: println("Corrupt play file");
      break;       
     }
     index = index + 2;
     char c = file.charAt(index - 1);
     int delayTime = c - '0';
     //123 for Metallica
     //126 for MetallicaDrumless
     return delayTime*123;
   } else {
    return -1; 
   }
  }
}