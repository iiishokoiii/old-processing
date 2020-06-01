int numFrames=1;
float xstart = random(10);
float xn = xstart;
float yn = random(10);

void setup() {
  size(500, 500);
  frameRate(60);
  background(255);
  blendMode(BLEND);
  smooth();
}

void draw() {
  for(int y=0;  y<=height; y+=5) {
    xn = xstart;
    yn += 0.1;
    for(int x=0;  x<=width; x+=5) {
      xn += 0.1;
      drawPoint(x, y, noise(x,y));
    }
  }
  countFrames(numFrames, false);
}

void drawPoint(float x, float y, float noise) {
  pushMatrix();
  translate(x, y);
  rotate(noise * radians(360));
  stroke(0, 150);
  line(0, 0, 20, 0);
  popMatrix();
}