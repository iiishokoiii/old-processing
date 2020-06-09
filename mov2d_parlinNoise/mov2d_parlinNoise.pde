int numFrames=50;
float xstart, ystart, xn, yn;
float xstartNoise, ystartNoise;

void setup() {
  size(960, 540);
  frameRate(24);
  background(0);
  blendMode(BLEND);
  smooth();
  xstartNoise = random(10)/10;
  ystartNoise = random(10)/10;
  xstart = random(10);
  ystart = random(10);
}

void draw() {
  fadeBackground(200);
  // xstart += noise(xstartNoise) * 0.2 - 0.1;
  // ystart += noise(ystartNoise) * 0.2 - 0.1;
  yn = ystart;
  for(int y=0;  y<=height; y+=5) {
    xn = xstart;
    yn += 0.1;
    for(int x=0;  x<=width; x+=5) {
      xn += 0.1;
      drawPoint(x, y, noise(xn, yn), noise(xstartNoise, ystartNoise));
    }
  }
  xstartNoise += 0.08;
  ystartNoise += 0.08;
  countFrames(numFrames, false);
}

void drawPoint(float x, float y, float noise, float startNoise) {
  pushMatrix();
  translate(x, y);
  rotate(noise * radians(360) + (startNoise * 2 -1 ) * radians(200));
  stroke(randomCol(noise), 100);
  line(0, 0, 40 * noise, 0);
  popMatrix();
}

color  randomCol(float noise) {
  float colB = int(160 * noise) + 95;
  float colG = random(200, 250);
  float colR = random(50, 80);
  color col = color (colR, colG, colB);
  return col;
}
