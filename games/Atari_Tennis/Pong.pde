class Pong{
  int posX,posY;
  int w,h;
  int upKey,downKey;
  int speed;
  int startSpeed;
  int spawnX,spawnY;
  boolean botMode;
  String name;
  int botDelay = (int)(2*40/frameRate);
  int botDC = 0;
  int[] fillC;
 Pong(int spawnX,int spawnY,int _width,int _height,int upKey,int downKey,int speed,boolean compControlled, String name , int[] fillColor){
   posX = spawnX;
   this.spawnX = spawnX;
   this.spawnY = spawnY;
   posY = spawnY;
   w = _width;
   h = _height;
   this.upKey = upKey;
   this.downKey = downKey;
   this.speed = speed;
   botMode = compControlled;
   this.name = name;
   this.startSpeed = speed;
   fillC = fillColor;
 }
 void animate(){
   if (botMode){
    if (speed<0)
     speed=-startSpeed-(int)random(4);
   else
     speed=+startSpeed+(int)random(4); 
    
   }
  
   fill(fillC[0],fillC[1],fillC[2]);
   rect(posX-w/2,posY-h/2,w,h);
   fill(0);
 }
 void handleKeys(int in){
   if (!botMode){
    if (in==upKey)
      up(speed);
    else if (in==downKey)
      down(speed);
      
   
   }else {
     if (botDC==botDelay){
       botDC = 0;
    if (ball.getY()+7>posY)
      down((int)(speed*0.6));
    else if (ball.getY()+7<posY)
      up((int)(speed*0.6));
     }else {
        botDC++;
     }
   }
 }
 String getName(){
  return name; 
 }
 int getX(){
  return posX; 
 }
 int getY(){
  return posY; 
 }
 int getWidth(){
  return w; 
 }
 int getHeight(){
  return h; 
 }
 int getSpawnX(){
   return spawnX;
   }
 void down(int speed){
  if (posY<560){
    if (botMode)
    posY+=speed;
    else 
    posY+=speed+1.4*(frameRate/40);
  }
 }
 void up(int speed){
  if (posY>40){
    if (botMode)
    posY-=speed;
    else 
    posY-=speed+1.4*(frameRate/40);
  }
 }
 void reset(){
  posX = spawnX;
  posY = spawnY;
 }
  
  
  
  
}
