int numFrames=100;
int T=numFrames;
int numPoints=5000;

float diameterX = 180f;
float diameterY = 180f;
float xofst1 = +0.0f * width;
float xofst2 = -0.0f * width;
float yofst1 = +0.0f * height;
float yofst2 = -0.0f * height; 
float lerpDelay = 1.0f;
float nRotate1= 1.0f;
float nRotate2= 4.0f;
 
void setup() {
  size(960, 540, P2D);
  frameRate(40f);
  background(0);
  smooth();
  blendMode(BLEND);
  strokeWeight(1); 
}

void draw() {
  translate(width/2, height/2);
  float t =1.0f * (frameCount - 1)/T;
  color col = waveCol(t, 1, 30);
  stroke(col);
  fill(col);
  if (frameCount <= T) {
    drawPoint(t);
  }
  countFrames(numFrames, true);
  // countFrames(numFrames+40, true);
}

void drawPoint(float t) {
  for (int i=0; i<numPoints; i++) {
    float tt = 1.0f * i /numPoints; 
    float yfactor = 0;
    //float yfactor = cos(TWO_PI*t)* height * 0.1 * sin(PI*tt);
    float x = lerp(x1(t - lerpDelay * tt), x2(t - lerpDelay * (1-tt)), tt);
    float y = lerp(y1(t - lerpDelay * tt), y2(t - lerpDelay * (1-tt)), tt) + yfactor;
    point (x, y);
  }
}
float locationX(float t, float ofst, float n) {
  return ofst + diameterX * cos(n * TWO_PI*t);
}
float locationY(float t, float ofst, float n) {
  return ofst + diameterY * sin(n * TWO_PI*t);
}
float x1(float t) {
  return locationX(t, xofst1, nRotate1);
}
float y1(float t) {
  return locationY(t, yofst1, nRotate1);
}
float x2(float t) {
  return locationX(t, xofst2, nRotate2);
}
float y2(float t) {
  return locationY(t, yofst2, nRotate2);
} 

color  waveCol (float t, int n, float alpha) {
  color col;
  float colR = 255f;
  float colB = 255f;
  float colG = 255f;
  if (n==1) {
    colR= 100f * cos(1.50f * TWO_PI * t) + 155f;
    colB = 240f;
    colG = 255f;
    alpha = 40f;
  } 
  col = color (colR, colB, colG, alpha);
  return col;
}

// -------- fade baackground ---------
void fadeBackground(float alpha) {
  pushStyle();
  fill(0, alpha); 
  noStroke(); 
  rect(0, 0, width, height); 
  popStyle();
}
  
//--------- count frames and stop ---------
// myFlg=true:  Export TIF files for making movie
void countFrames(int n, boolean myFlg) {
  if (myFlg) {
    saveFrame("preview/frame/fr###.tif");
  } else {};
  if (frameCount== n) {
    saveFrame("export.png");
    stop();
  }
}