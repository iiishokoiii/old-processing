int numCircle = 20;
int numParticle = 1000;
int numFrames=7;
NoiseWaveCircle [] noiseWaveCircle =new NoiseWaveCircle[numCircle];
Particle [] particle =new Particle[numParticle];
color col_bg1 = color(15, 50, 110, 60);
color col_bg2= color(180, 200, 110, 60);
color col_bg = color(0, 30);

void setup() {
  size(960, 540, P2D);
  frameRate(60f);
  background(col_bg);
  blendMode(BLEND);
  // setGradient(0, 0, width, height, col_bg1, col_bg2, 2);
  smooth();
  initialize();
}

void initialize() {
  for (int j=0; j<numCircle; j++) {
    float yoff = 0.2*j;
    noiseWaveCircle[j]= new NoiseWaveCircle(yoff);
    noiseWaveCircle[j].col = randomCol(50);
    noiseWaveCircle[j].location.x = random(0, width);  //大きな円の位置
    noiseWaveCircle[j].location.y = random(0, height);
    noiseWaveCircle[j].diameter = 200f;
  }
  for (int k=0; k<numParticle; k++) {
    particle[k]=new Particle();
    particle[k].col = randomCol(80);
    particle[k].setLocation();  //Particleの位置
  }
}
void draw() {  
  for (int j=0; j<numCircle; j++) {
    pushMatrix();
    translate(noiseWaveCircle[j].location.x, noiseWaveCircle[j].location.y);
    blendMode(ADD);
    noiseWaveCircle[j].display();
    popMatrix();
    noiseWaveCircle[j].update();
  }
  for (int k=0; k<numParticle; k++) {
    particle[k].display();
    particle[k].update();
  }
  fadeBackground(col_bg);
  countFrames(numFrames, false);
}

class NoiseWaveCircle{
  int numPoint = 60;
  float r[] = new float [numPoint];
  float theta[] = new float [numPoint];
  float xoff;
  float yoff; 
  color col;
  PVector location;
  float diameter;  //大きな円の半径
  //コンストラクタ
  NoiseWaveCircle (float _yoff) {
    xoff = 0;
    yoff = _yoff;
    location = new PVector(width/2, height/2);
    // 小さな円の初期値
    for (int i=0; i<numPoint; i++) {
      float tt = 1.0f * i/numPoint;
      xoff += 0.03f;
      r[i] =  map(noise(xoff, yoff), 0, 1, 140f, 260f);   //小さな円の位置
      theta[i] = map(noise(xoff, yoff), 0, 1, 0, 100);     //小さな円の位置
    }
  }
  void update() {
    xoff =0;
    for (int i=0; i<numPoint; i++) {
      xoff += 0.2f;
      r[i] =  map(noise(xoff, yoff), 0, 1, 140f, 260f);
      theta[i] = map(noise(xoff, yoff), 0, 1, 0, 100);
    }
    yoff += 0.2f;
  }
  void display() {
    strokeWeight(2);
    stroke(col);
    fill(col);
    //小さな円の描画
    for (int i=0; i<numPoint; i++) {
      float diameter2= map(noise(xoff, yoff), 0, 1, 10f, 20f);
      ellipse(r[i] * cos(theta[i]),  r[i] * sin(theta[i]), diameter2, diameter2); 
    }
  }
}

color randomCol(float alpha) {
  float colR = random(150f, 240f);
  float colB = random(150f, 240f);
  color col = color (colR, 80f, colB, alpha);
  return col;
}
