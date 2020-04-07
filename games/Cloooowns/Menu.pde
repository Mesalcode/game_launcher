void menu(){
  textSize(48);
  rect(displayWidth/5,displayHeight/5,displayWidth-displayWidth/5*2,displayHeight-displayHeight/5*2);
  fill(0);
  textMode(CENTER);
  text("Optionen",displayWidth/2-displayWidth/19,displayWidth/7);
  
  
  text("Neustart",displayWidth/2-displayWidth/19,displayWidth/4);
  text("Beenden",displayWidth/2-displayWidth/19,displayWidth/4+displayWidth/10);
  textMode(CORNER);
  fill(255);
}
void handleMenuPress(int mX, int mY){
  if (mY>displayWidth/4-displayWidth/16&mY<displayWidth/4+displayWidth/16){
   music.stop();
   init(); 
  }else if (mY>displayWidth/2-displayWidth/19-displayWidth/10&mY<displayWidth/2-displayWidth/19+displayWidth/16){
    System.exit(0);
  }
}
