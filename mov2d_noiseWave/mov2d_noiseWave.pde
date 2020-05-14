int numObj=100;
int numFrames=16;
NoiseWave []  noisewave =new NoiseWave[numObj];
color col[] = new color [numObj];

void setup() {
  size(960, 540);
  frameRate(5);
  background(0);
  smooth();
  for (int i=0; i<numObj; i++) {
  noisewave[i]=new NoiseWave(0.2*i);
 }
}

void draw() {
  blendMode(BLEND);
  for(int i=0;  i<numObj; i++) {
    noStroke();
    strokeWeight(1);
    noisewave[i].draw();
  }
  countFrames(numFrames, false);
}

// -------generate noise wave --------
class NoiseWave {
  int numPoint=ceil(width/10);
  float x[]  =new float [numPoint];
  float y[]  =new float [numPoint];
  float yoff ;      // 2nd dimension of perlin noise 
 
  NoiseWave(float _yoff) {
    yoff=_yoff;
    for (int i=0; i<numPoint; i++) {
      x[i]= i*10;
    }
  }

  void draw() {
    pushMatrix();
    translate(0, map(noise(yoff, yoff+0.02), 0, 1, height*0.3, height*0.7));

    float xoff = 0.0;  
    for (int i=0; i<numPoint; i++) {
      y[i] = map(noise(xoff, yoff), 0, 1, -220, 220);
      xoff += 0.03; //point1ごとにインクリメント
    }
    stroke(map(noise(yoff, yoff+0.02), 0, 1,0, 240), 60, 100, 20);
    fill(map(noise(yoff, yoff+0.02), 0, 1,0, 240), 60, 100,  20);

    beginShape();
    for (int i=0; i<numPoint; i++) {
      vertex(x[i], y[i]); 
    }
    for (int i=numPoint-1; i>0; i--) {
      vertex(x[i], y[i]+1); 
    }
    yoff += 0.02;      //frameごとにインクリメント
    endShape();
    popMatrix();
  }
}
