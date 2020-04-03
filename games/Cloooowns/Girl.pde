class Girl extends Clown{
  Girl(PImage girlImage, int startX,int fixedY, int movementDelayInFrames){
    super(girlImage,girlFrightened, startX, fixedY, movementDelayInFrames,true);
  }
  
  @Override
  void animate(){
   if (!swapped)
   image(img,x,y+displayHeight/12+displayHeight/24);
   else
   image(weakclownImage,x,y);
 }
 @Override
 void spawnBallon(){
  int col[] = {255,215,0,255};
  if (!swapped){
  if (random(100)>=95)
    bloons.add(new CashBalloon(x,y+40,bloonSpeed,col,1,50,0));
  }else{
     bloons.add(new Balloon(x,y+40,bloonSpeed,col,0,1,1));
    
  }
 }
}
