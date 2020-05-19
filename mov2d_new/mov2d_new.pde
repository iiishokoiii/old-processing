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
  countFrames(numFrames, false);
}

color  randomCol(float _yoff) {
  float colR = random(160, 255);
  float colG = random(160, 255);
  color col = color (colR, colG, 80f, 20);
  return col;
}
