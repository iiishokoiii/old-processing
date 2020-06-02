int numFrames=1;
float xstart = random(10);
float xn = xstart;
float yn = random(10);

void setup() {
  size(960, 540);
  frameRate(60);
  background(0);
  blendMode(BLEND);
  smooth();
}

void draw() {
  for(int y=0;  y<=height; y+=10) {
    xn = xstart;
    yn += 0.1;
    for(int x=0;  x<=width; x+=10) {
      xn += 0.1;
      stroke(randomCol(noise(x,y)), 180);
      fill(randomCol(noise(x,y)), 150);
      drawCircle(x, y, noise(x,y), 20);
    }
  }
  for(int y=0;  y<=height; y+=20) {
    xn = xstart;
    yn += 0.1;
    for(int x=0;  x<=width; x+=20) {
      xn += 0.2;
      stroke(randomCol(noise(x,y)), 150);
      fill(randomCol(noise(x,y)), 120);
      drawCircle(x, y, noise(x,y), 60);
    }
  }
  countFrames(numFrames, false);
}

void drawCircle(float x, float y, float noise, float r) {
  rotate(noise * radians(360));
  float _r = r * noise;
  ellipse(x, y, _r, _r);
}

color  randomCol(float noise) {
  float colR = int(160 * noise) + 95;
  float colG = random(100, 140);
  float colB = random(100, 140);
  color col = color (colR, colG, colB);
  return col;
}