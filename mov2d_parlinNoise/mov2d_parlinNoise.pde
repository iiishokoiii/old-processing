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
  for(int y=0;  y<=height; y+=1) {
    xn = xstart;
    yn += 0.01;
    for(int x=0;  x<=width; x+=1) {
      xn += 0.01;
      int alpha = int(noise(xn, yn) * 255);
      stroke(0, alpha);
      // point(x,y);
      line(x, y, x+1, y+1);
      // println(alpha);
    }
  }
  countFrames(numFrames, false);
}