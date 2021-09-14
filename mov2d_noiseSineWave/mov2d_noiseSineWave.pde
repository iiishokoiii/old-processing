int numFrames =300;
int numPoints = 400; 
int numObj = 8;
Particle[][] particle = new Particle[numPoints][numObj]; 
float yofst[] = new float [numObj];
void setup() {
  size(960, 540, P2D); 
  frameRate(40f); 
  background(0); 
  smooth();
  initialize();
  setLocationY();
}
void initialize() {
  translate(0, height/2f);
  for (int j=0; j<numObj; j++) {
    color  col = randomCol();
    float amp = 0.1f * sqrt(j  + 1) * height;
    float delay = PI * j / numObj;
    for (int i = 0; i < numPoints; i++) {
      float tt = 1.0f * i/numPoints;
      particle[i] [j] = new Particle(tt);
      particle[i] [j].amp = amp;
      particle[i][j].delay = delay;
      particle[i] [j].col = col;
      particle[i] [j].setLocationCos();
    }
  }
}
void setLocationY() {
   for (int j=0; j<numObj; j++) {
     yofst[j] = height * random(0.4f, 0.6f);
   }
}
void draw() {
  for (int j=0; j<numObj; j++) {
    pushMatrix();
    translate(0, yofst[j]);
    for (int i = 0; i < numPoints; i++) {
      particle[i] [j].update();
      particle[i] [j].display();
    }
    popMatrix();
  }
  fadeBackground(80f);
  // saveFrame("preview/frame/fr###.tif");
  if (frameCount== 300) {
    saveFrame("export.png");
    stop();
  }
}

class Particle {
  float amp = height * 0.25f;
  float xmax = width;
  float ymax = height;
  float ymin = -height;
  float numT = 1f;
  float x = 0;
  float y = 0;
  float tt = 0;
  color col = color(255f, 40f);
  float delay = 0;

  Particle (float _tt) {
    tt = _tt;
  }
  void setLocationCos() {
    x = tt * width;
    y = amp * cos(numT * TWO_PI * tt + delay);
  }
  void update() {
    if (x > width) {
      x += random(-1.0f, 2.5f);
    } else {
      x -= random(-1.0f, 2.5f);
    }
    y += random(-2.0f, 2.0f);
    if (y > ymax) {
      y = ymax;
    } else if (y < ymin) {
      y = ymin;
    }
  }
  void display() {
    blendMode(ADD);
    strokeWeight(1);
    stroke(col); 
    point(x, y);
  }
}

color  randomCol() {
  float colR = random(100, 220);
  float colG = random(100, 220);
  color col = color (colR, colG, 80f, 90f);
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
  // println("saving frame " + frameCount + "/" + n);
  if (myFlg) {
    saveFrame("frame/fr###.tif");
  } else {};
  if (frameCount== n) {
    saveFrame("export.png");
    stop();
  }
}