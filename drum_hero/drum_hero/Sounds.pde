void initPlayers() {
  minim = new Minim(this);
  openHat = minim.loadFile("open_hi_hat.wav");
  closedHat = minim.loadFile("closedHiHat.wav");
  snare = minim.loadFile("snare5.wav");
  crash = minim.loadFile("crash.wav");
  bass = minim.loadFile("bass.wav");
  tom = minim.loadFile("tom.wav");
  
  song = minim.loadFile("Metallica.mp3");
  
}