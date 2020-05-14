int numObj=80;
int numFrames=100;
NoiseWave []  noisewave =new NoiseWave[numObj];
color col[] = new color [numObj];

void setup() {
  size(1920, 1080);
  frameRate(60);
  background(0);
  for (int i=0; i<numObj; i++) {
  col[i]= color(100, random(0, 255), 200, 80);
  noisewave[i]=new NoiseWave(0.2*i);
 }
}

void draw() {
  blendMode(BLEND);
  for(int i=0;  i<numObj; i++) {
    fill(col[i]);
    noStroke();
    strokeWeight(1);
    noisewave[i].draw();
  }
  blendMode(ADD);
  fadeBackground(1);
  frameCount(numFrames, false);
}

// -------generate noise wave --------
class NoiseWave {
  int numPoint=ceil(width/10);
  float x[]  =new float [numPoint];
  float y[]  =new float [numPoint];
  color col;
  float yoff ;      // 2nd dimension of perlin noise 
 
  NoiseWave(float _yoff) {
    yoff=_yoff;
    for (int i=0; i<numPoint; i++) {
      x[i]= i*10;
    }
  }

  void draw() {
    float xoff = 0.0;  
    for (int i=0; i<numPoint; i++) {
      y[i] = map(noise(xoff, yoff), 0, 1, 100, 400); 
      xoff += 0.03;   
    }
    beginShape();
    for (int i=0; i<numPoint; i++) {
      vertex(x[i], y[i]); 
    }
    for (int i=numPoint-1; i>0; i--) {
      vertex(x[i], y[i]+1); 
    }
    yoff += 0.02;      //frameごとにインクリメント
    endShape();
  }
}
