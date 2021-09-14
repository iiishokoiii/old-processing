int numObj=100;
int numFrames=16;
NoiseWave []  noisewave =new NoiseWave[numObj];

void setup() {
  size(960, 540);
  frameRate(5);
  background(0);
  smooth();
  for (int i=0; i<numObj; i++) {
    
  }
}

void draw() {
  blendMode(BLEND);
  noStroke();
  strokeWeight(1);
  pushMatrix();
  translate(0, locationY);
  for(int i=0;  i<numObj; i++) {

  }
  popMatrix();
    // saveFrame("preview/frame/fr###.tif");
  if (frameCount== numFrames) {
    saveFrame("export.png");
    stop();
  }
}

color  randomCol(float _yoff) {
  float colR = random(160, 255);
  float colG = random(160, 255);
  color col = color (colR, colG, 80f, 20);
  return col;
}

// -------- fade baackground ---------
void fadeBackground(float alpha) {
  pushStyle();
  fill(0, alpha); 
  noStroke(); 
  rect(0, 0, width, height); 
  popStyle();
}
  
//--------- count frames and stop ---------
// myFlg=true:  Export TIF files for making movie
void countFrames(int n, boolean myFlg) {
  // println("saving frame " + frameCount + "/" + n);
  if (myFlg) {
    saveFrame("frame/fr###.tif");
  } else {};
  if (frameCount== n) {
    saveFrame("export.png");
    stop();
  }
}