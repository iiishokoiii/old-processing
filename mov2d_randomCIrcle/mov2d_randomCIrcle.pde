int numFrames = 1;
float xstart = random(10);
float xn = xstart;
float yn = random(10);

void setup() {
  size(960, 540);
  background(0);
  blendMode(BLEND);
  strokeWeight(1);
  smooth();
}

void draw() {
  for(int y= -20;  y<=height; y+=100) {
    xn = xstart;
    yn += 0.1;
    for(int x=0;  x<=width; x+=100) {
      xn += 0.1;
      float noise= noise(xn, yn);
      float r = 10 * noise;
      float originX = x + 100 * noise;
      float originY = y + 100 * noise;
      stroke(randomCol(noise));
      drawCircle(originX, originY, r, noise);
    }
  }
  // fadeBackground(0);
  countFrames(numFrames, false);
}

void drawCircle(float originX, float originY, float r, float noise) {
  float rn = 0.2;
  float _x, _y;
  int angleStart = int(360 * noise);
  int angleEnd = int(1600 * noise);
  float angleStep = 1;
  for (float ang=angleStart; ang<=angleEnd; ang+=angleStep) {
    r += 0.1;
    rn += 0.05;
    float _r = r + (200 * noise(rn));
    float rad = radians(ang);
    _x = originX + _r * cos(rad);
    _y = originY + _r * sin(rad);
    line(_x, _y, originX, originY);
  }
}

color  randomCol(float noise) {
  float colR = int(255 * noise);
  float colG = random(100, 140);
  float colB = random(100, 140);
  color col = color (colR, colG, colB, 50);
  return col;
}
