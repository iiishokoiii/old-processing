int T=100;
int numFrames=100;
int numPoints=3200;
 
void setup() {
  size(960, 540, P2D);
  background(0);
  frameRate(20);
  stroke(255);
  fill(255);
}
float diameterX = 400;
float diameterY = 400;
float x1(float t, float xoff){
  return xoff + diameterX*cos(TWO_PI*t);
}
float y1(float t, float yoff){
  return yoff + diameterY*sin(TWO_PI*t);
}
float x2(float t, float xoff){
   return xoff + diameterX*cos(1*TWO_PI*t);
}
float y2(float t, float yoff){
  return yoff + diameterY*sin(1*TWO_PI*t);
}
void draw() {
  translate(width/2, height/2);
  float t = 1.0*(frameCount - 1)/T;
  float xoff1=-0.4*width;
  float xoff2=0.2*width;
  float yoff1=0.2*height;
  float yoff2=-0.4*height;
  float delay=3.0;
  float xn= 0.01;
  float yn =0.01;
  pushStyle();
  strokeWeight(2);
  if (frameCount <= T) {
    for (int i=0; i <numPoints; i++) {
      float tt = 1.0*i/numPoints;
      float x = lerp(x1(t - delay*tt, xoff1),x2(t - delay*(1-tt), xoff2), tt);
      float y = lerp(y1(t - delay*tt, yoff1),y2(t - delay*(1-tt), yoff2), tt);
      stroke(100*cos(1.5*TWO_PI*tt)+155,120,  255, 100);
      float n = map(noise(xn, yn), 0, 1, 0, 160); 
      point(x+n, y+n);
      xn += 0.03;
    }
    yn+=0.05;
  }
  popStyle();
  countFrames(numFrames, false);
  // countFrames(numFrames+40, true);
}
