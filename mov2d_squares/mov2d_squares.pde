int numObj=30;
int numFrames=3;
color col[] = new color [numObj];
randomRecs recs[] = new randomRecs [numObj];

void setup() {
  size(960, 540);
  frameRate(1);
  background(0);
  
  for (int i=0; i<numObj; i++) {
    col[i]= color(100, random(0, 255), 240, 80);
    recs[i] = new randomRecs(60, random(0,width), random(0, height), random(100,200), random(100,200));
  }
}

void draw(){
  for (int i=0; i<numObj; i++) {
    blendMode(BLEND);
    recs[i].border();
    recs[i].draw();
  }
  if(frameCount == numFrames) {
    saveFrame("fr###.png");
    stop();
  }
}

class randomRecs{
  int numSubObj;
  float w, h, x, y;
  
  randomRecs(int n, float _x, float _y, float _w, float _h) {
    numSubObj=n;
    w=_w;
    h=_h;
    x=_x;
    y=_y;
  }
  
  void border() {
    rectMode(CORNER);
    stroke(255);
    noFill();
    strokeWeight(1);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  
  void draw() {
    pushMatrix();
    translate(x, y);
    for (int i=0; i<numSubObj; i++) {
      rectMode(CENTER);
      rect(random(-w/2, w/2), random(-h/2, h/2), random(5,10), random(5,10));
    }
    popMatrix();
  }
}
