int numObj=100;
int numFrames=16;
NoiseWave []  noisewave =new NoiseWave[numObj];

void setup() {
  size(960, 540);
  frameRate(5);
  background(0);
  smooth();
  for (int i=0; i<numObj; i++) {
    float yoff = 0.2*i;
    color col = randomCol(yoff);
    noisewave[i]=new NoiseWave(yoff);
    noisewave[i].col =col;
  }
}

void draw() {
  float locationY = height/2;
  blendMode(BLEND);
  noStroke();
  strokeWeight(1);
  pushMatrix();
  translate(0, locationY);
  for(int i=0;  i<numObj; i++) {
    noisewave[i].display();
  }
  for(int i=0;  i<numObj; i++) {
    noisewave[i].update();
  }
  popMatrix();
  // fadeBackground(70);
  if (frameCount== numFrames) {
    saveFrame("export.png");
    stop();
  }
}

// -------generate noise wave --------
class NoiseWave {
  int numPoint=ceil(width/10);
  float x[]  =new float [numPoint];
  float y[]  =new float [numPoint];
  float xoff;
  float yoff;      // 2nd dimension of perlin noise 
  color col;
 
  NoiseWave(float _yoff) {
    xoff = 0;
    yoff=_yoff;
    for (int i=0; i<numPoint; i++) {
      x[i]= i*10;
      xoff += 0.03;   //pointごとにインクリメント
      y[i] = map(noise(xoff, yoff), 0, 1, -height*0.4, height*0.4);
    }
  }
  //frameごとの変化
  void update() {
    xoff =0;
    for (int i=0; i<numPoint; i++) {
      x[i] = i * 10;
      xoff += 0.03;   //pointごとにインクリメント
      y[i] = map(noise(xoff, yoff), 0, 1, -height*0.5, height*0.4);
    }
    yoff += 0.02;     //frameごとにインクリメント
  }
  void display() {
    stroke(col);
    fill(col);
    beginShape();
    for (int i=0; i<numPoint; i++) {
      vertex(x[i],  y[i]); 
    }
     for (int i=numPoint-1; i>0; i--) {
      vertex(x[i],  y[i]+1); 
    }
    endShape();
  }
}

color  randomCol(float _yoff) {
  float colR = random(160, 255);
  float colG = random(160, 255);
  color col = color (colR, colG, 80f, 20);
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