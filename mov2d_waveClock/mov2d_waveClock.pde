int numFrames = 500;
float angleStep = 1;
float ang = 0;
float angn = 0.5;
int angleSign = 1;
float r = 150;
float rn = 0.1;
float xn = 0.05;
float yn = 0.05;
int col = 250;
int colStep = -1;

void setup() {
  size(960, 680);
  frameRate(60);
  background(0);
  smooth();
  blendMode(BLEND);
  strokeWeight(1);
}

void draw() {
  stroke(col, 90);
  float x1, y1, x2 ,y2;
  float originX, originY;
  float _r = r + (150 * noise(rn));
  float rad = radians(ang);
  originX = width / 2 + (noise(xn) * 120) -60;
  originY = height / 2 + (noise(yn) * 80) -40;
  x1 = originX + _r * cos(rad);
  y1 = originY + _r * sin(rad);
  x2 = originX - _r * cos(rad);
  y2 = originY - _r * sin(rad);
  line(x1, y1, x2, y2);
  r += 1;
  rn += 0.1;
  xn += 0.05;
  yn += 0.05;
  angn += 0.05;
  if (ang > 180 || ang < 0) { angleSign *= -1;}
  ang += angleSign * (angleStep + 2 * noise(angn)) / 3;
  if (col > 255 || col < 120) { colStep *= -1;}
  col += colStep;
  countFrames(numFrames, false);
}

color  stepCol(int _col) {
  float colG = random(160, 255);
  float colB = random(160, 255);
  color col = color (_col, colG, colB, 80);
  return col;
}