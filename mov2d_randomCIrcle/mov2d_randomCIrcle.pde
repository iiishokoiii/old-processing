int numFrames = 30;

void setup() {
  size(960, 540);
  background(0);
  blendMode(BLEND);
  strokeWeight(1);
  smooth();
}

void draw() {
  float r = 10;
  float rn = 0.2;
  float originX = width * random(10) *0.1;
  float originY = height * random(10) *0.1;
  drawCircle(originX, originY, r, rn);
  fadeBackground(0);
  countFrames(numFrames, false);
}

void drawCircle(float originX, float originY, float r, float rn) {
  float x, y;
  int angleStart = int(random(360));
  int angleEnd = int(random(600, 1440));
  float angleStep = 0.5 + 0.1 * int(random(10));
  stroke(randomCol());
  for (float ang=angleStart; ang<=angleEnd; ang+=angleStep) {
    r += 0.1;
    rn += 0.05;
    float _r = r + (200 * noise(rn));
    float rad = radians(ang);
    x = originX + _r * cos(rad);
    y = originY + _r * sin(rad);
    line(x, y, originX, originY);
  }
}

color  randomCol() {
  float colR = random(180, 255);
  float colG = random(100, 140);
  float colB = random(100, 140);
  color col = color (colR, colG, colB, 30);
  return col;
}
