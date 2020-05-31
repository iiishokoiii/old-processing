int numFrames = 800;
float angleStep = 0.5;
float ang = 0;
float angn = 0.5;
float r = 150;
float rn = 0.05;
float xn = 0.05;
float yn = 0.05;
int col = 250;
int colStep = -1;

void setup() {
  size(960, 540);
  frameRate(60);
  background(0);
  smooth();
  blendMode(BLEND);
  strokeWeight(1);
}

void draw() {
  stroke(stepCol(col));
  float x1, y1, x2 ,y2;
  float originX, originY;
  float _r = r + (100 * noise(rn));
  float rad = radians(ang);
  originX = width / 2 + (noise(xn) * 100) -50;
  originY = height / 2 + (noise(yn) * 100) -50;
  x1 = originX + _r * cos(rad);
  y1 = originY + _r * sin(rad);
  x2 = originX - _r * cos(rad);
  y2 = originY - _r * sin(rad);
  line(x1, y1, x2, y2);

  ang += (angleStep + 2 * noise(angn)) / 5;
  r += 1;
  rn += 0.05;
  xn += 0.05;
  yn += 0.05;
  angn += 0.05;
  if (col > 250) { colStep = -1;}
  if (col < 70) { colStep = +1;}
  col += colStep;
  countFrames(numFrames, false);
}

color  stepCol(int _col) {
  float colR = random(160, 255);
  float colB = random(160, 255);
  color col = color (colR, _col, colB, 60);
  return col;
}