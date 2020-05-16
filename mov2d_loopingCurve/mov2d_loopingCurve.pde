int numFrames=100;
int numObj=30;
int m=1000;

void setup() {
  size(960, 540, P2D);
  background(0);
  frameRate(40);
  stroke(255);
  fill(255);
}
float x1(float t){
  return 0.25*width + 80*cos(TWO_PI*t);
}
float y1(float t){
  return 0.5*height + 50*sin(TWO_PI*t);
}
float x2(float t){
  return 0.75*width + 80*cos(2*TWO_PI*t);
}
float y2(float t){
  return 0.5*height + 50*sin(2*TWO_PI*t);
}
void draw() {
  float t = 1.0*(frameCount - 1)/numFrames;
  pushStyle();
  strokeWeight(2);
  stroke(255,30);
  for(int i=0; i <=m; i++){
    float tt = 1.0*i/m;
    float x = lerp(x1(t), x2(t), tt);
    float y = lerp(y1(t), y2(t), tt);
    point(x,y);
  }
  popStyle();
  countFrames(numFrames, false);
  // countFrames(numFrames+40, true);
}
