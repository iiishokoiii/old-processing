int numFrames =400;
int numObj = 10000; 
float[] x = new float[numObj]; 
float[] y = new float[numObj]; 

void setup() {
  size(800, 600, P2D); 
  frameRate(50); 
  background(0); 
  for (int i = 0; i < numObj; i++) {
    x[i] = i*width/(numObj);
    y[i] = (height/4)*cos(i*(2*PI*12/numObj))+height/2;  
  stroke(255); 
  noFill(); 
  blendMode(ADD); 
  }
  //mySetExportGif(20 , "test.gif") ;
}

void draw() {
  for (int i = 0; i <numObj ; i++) {
    translate(0.4,0);
    point(x[i], y[i]); // 点を描画
    if (x[i]>width) {
      x[i] += random(-1, 2.5);   // X座標をランダムに移動
    } else {
      x[i] += random(-2.5, 1);    // X座標をランダムに移動
    }
    y[i] += random(-2, 2);     // Y座標をランダムに移動
    if (y[i]>height*3/4) {
      y[i]=height*3/4;
    } else if(y[i]<height*1/4) {
      y[i]=height*1/4;
    }
  }
  fadeBackground(0.8);
  countFrames(numFrames, false);
  //exportGif(numFrames);
}
