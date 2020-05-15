int numFrames =200;
int numPoints = 2000; 
int numObj = 3;
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
    for (int i = 0; i < numPoints; i++) {
      float tt = 1.0f * i/numPoints;
      particle[i] [j] = new Particle(tt);
      particle[i] [j].amp = 0.2f * sqrt(j + 1) * height;
      particle[i] [j].col = col;
      if (j%2 == 0) {
        particle[i] [j].setLocationCos();
      } else {
        particle[i] [j].setLocationSin();
      }
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
      particle[i] [j] .update();
      particle[i] [j].display();
    }
    popMatrix();
  }
  fadeBackground(80f);
  countFrames(200, false);
}

class Particle {
  float amp = height * 0.25f;
  float xmax = width;
  float numT = 1.5f;
  float x = 0;
  float y = 0;
  float tt = 0;
  color col = color(255f, 40f);
  Particle (float _tt) {
    tt = _tt;
  }
  void setLocationCos() {
    x = tt * width;
    y = sqrt(tt) * amp * cos(numT * TWO_PI * tt);
  }
  void setLocationSin() {
    x = tt * width;
    y = sqrt(tt) * amp * sin(numT * TWO_PI * tt);
  }
  void update() {
    if (x > width) {
      x += random(-1.0f, 2.5f);
    } else {
      x -= random(-1.0f, 2.5f);
    }
    y += random(-2.0f, 2.0f);
    if (y > amp) {
      y = amp;
    } else if (y < -amp) {
      y = -amp;
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
    color col = color (colR, colG, 80f, 70f);
    return col;
  }
