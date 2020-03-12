class Ball{
 int posX,posY,rad;
 int speedX,speedY;
 int startSX,startSY;
 int spawnX,spawnY;
 Ball(int spawnX,int spawnY,int startSpeedX,int startSpeedY,int radius){
   this.spawnX = spawnX;
   this.spawnY = spawnY;
   posX = spawnX;
   posY = spawnY;
   rad = radius;
   speedX = startSpeedX;
   speedY = startSpeedY;
   startSX = startSpeedX;
   startSY = startSpeedY;
 }
 void respawn(){
   
   posX=spawnX;
   posY=spawnY;
   speedX=startSX*-1;
   speedY=startSY*-1;
 }
 void animate(){
   if (speedX<0)
     fill(red[0],red[1],red[2]);
   else
     fill(green[0],green[1],green[2]);
   frameRate(frameRate+0.39);
 
   
  
   
   
   circle(posX,posY,rad);
   fill(0);
   if (posX>590){
     score(0,1);
   }else if (posX<10){
     score(1,0);
   }else {
     
   if (posY<30||posY>570){
     speedY*=-1;
    
   }
   if ((posX-10<=pong1.getSpawnX()&&posX-25<=pong2.getSpawnX()-pong2.getWidth()&&posY<=pong1.getY()+pong1.getHeight()/2&&posY>=pong1.getY()-pong1.getHeight()/2 )||( posX+30>=pong2.getSpawnX()&&posX+45<=pong2.getSpawnX()+pong2.getWidth()&&posY<=pong2.getY()+pong2.getHeight()/2&&posY>=pong2.getY()-pong2.getHeight()/2)){
     speedX*=-1;
    
     
    
     
     posX+=speedX;
     posY+=speedY;
   }else {
     posX+=speedX;
     posY+=speedY;
   }
   }
 }
 int getY(){
  return posY; 
 }
 
  
  
  
  
  
  
}
