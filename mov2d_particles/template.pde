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
  
// --------- initialized GIF export ----------
// import gifAnimation.*;
// GifMaker gifExport;
  
// -------- set GIF export-------
// void mySetExportGif(int delay, String fileName) {
//   gifExport = new GifMaker(this, fileName); // GifMakerオブジェクトを作る、第2引数にファイル名
//   gifExport.setRepeat(0);      // エンドレス再生
//   gifExport.setQuality(10);    // quality (defult:10)
//   gifExport.setDelay(delay);   // アニメーションの間隔を20ms(50fps)に
// }

//---------   Export GIF ----------
// void  exportGif(int n) {
//   println("saving frame " + frameCount + "/" + n);
//   gifExport.addFrame(); // フレームを追加
//   if(frameCount >= n){
//   gifExport.finish(); // 終了してファイル保存
//   exit();
//   }
// }
  
  
