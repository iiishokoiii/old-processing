int numFrames=5;
float xstart, ystart;
float xn, yn;


void setup() {
  size(960, 540);
  frameRate(60);
  background(0);
  smooth();
  // blendMode(SCREEN);

  xstart = random(10);
  ystart = random(10);
  xn = xstart;
  yn = ystart;
}

void draw() {
  for(int y=0;  y<=height; y+=10) {
    yn += 0.1;
    for(int x=0;  x<=width; x+=10) {
      xn += 0.1;
      blendMode(BLEND);
      stroke(randomCol(noise(xn,yn)), 180);
      fill(randomCol(noise(xn,yn)), 150);
      drawCircle(x, y, noise(xn,yn), 40);
    }
  }
  if (frameCount == numFrames) {
    for(int y=100;  y<=height; y+=180) {
      yn += 0.1;
      for(int x=100;  x<=width; x+=180) {
        xn += 0.2;
        blendMode(SCREEN);
        stroke(randomCol2(noise(xn,yn)), 180);
        fill(randomCol2(noise(xn,yn)), 160);
        drawCircle(x, y, noise(xn,yn), 130);
      }
    }
  }
  countFrames(numFrames, false);
}

void drawCircle(float x, float y, float noise, float r) {
  float _r = r * noise;
  ellipse(x, y, _r, _r);
}

color  randomCol(float noise) {
  float colR = random(120, 140);
  float colG = int(120 * noise) + 80;
  float colB = int(40 * noise) + 160;
  color col = color (colR, colG, colB);
  return col;
}

color  randomCol2(float noise) {
  float colB = 40;
  float colG = 60;
  float colR = int(80 * noise) + 70;
  color col = color (colR, colG, colB);
  return col;
}