class Clown implements Cloneable{
 public int x,y;
 PImage img;
 private int delay;
 private int dpos = 0;
 private boolean chase = false;
 boolean swapped = false;
 PImage frightenedImage;
 public boolean girl;
 Clown(PImage clownImage, PImage frightenedImage,int startX,int fixedY, int movementDelayInFrames){
  x = startX;
  y = fixedY;
  img = clownImage;
  delay = movementDelayInFrames;
  this.frightenedImage = frightenedImage;
  girl = false;
 }
 Clown(PImage clownImage, PImage frightenedImage,int startX,int fixedY, int movementDelayInFrames, boolean girl){
  x = startX;
  y = fixedY;
  img = clownImage;
  delay = movementDelayInFrames;
  this.frightenedImage = frightenedImage;
  this.girl = girl;
 }
 @Override
   public Object clone() throws CloneNotSupportedException {
      Clown cloned = (Clown)super.clone();
      return cloned;
   }
 void animate(){
   if (!swapped)
   image(img,x,y);
   else
   image(weakclownImage,x,y);
 }
 void swap(){
  swapped = true; 
 }
 void unswap(){
   swapped = false;  
 }
  void elevate(){
  y-=4; 
 }
 void move(){
  if (dpos<delay)
    dpos++;
  else
    changePosition();
 }
 void scare(){
   if (!swapped)
   img = frightenedImage;
   else
   img = weakclownFrightened;
   
 }
 void act(){
  move();
 }
 void chase(){
  chase = true;
  x+=8;
   
 }
 void spawnBallon(){
  int col[] = {(int)random(255),(int)random(255),(int)random(255),255};
  if (!swapped){
  if (random(100)>60)
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,200,5,2));
  else if (random(40)>39)
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,400,10,3));
  else if (random(100)>99)
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,1000,100,4));
  else
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,0,1,1));
  }else{
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,0,1,1));
  }
 }
 void changePosition(){
   dpos = 0;
   if (!chase){
   int lastX = x;
   x+= random(displayWidth/8)-displayWidth/16; 
   if (x<40||x>displayWidth-40)
     x = lastX;
   spawnBallon();
   }
 }
}
class WeakClown extends Clown{
  WeakClown(PImage clownImage, int startX,int fixedY, int movementDelayInFrames){
    super(clownImage,weakclownFrightened, startX, fixedY, movementDelayInFrames);
  }
  @Override
  void spawnBallon(){
    int col[] = {(int)random(255),(int)random(255),(int)random(255),255};
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,0,1,1));
    
  }
  
}
class StrongClown extends Clown{
  StrongClown(PImage clownImage, int startX,int fixedY, int movementDelayInFrames){
    super(clownImage,strongclownFrightened, startX, fixedY, movementDelayInFrames);
  }
  @Override
  void spawnBallon(){
    int col[] = {(int)random(255),(int)random(255),(int)random(255),255};
    if (random(100)>60)
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,400,5,3));
    else
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,200,5,2));
  }
 
}
class BossClown extends Clown{
    BossClown(PImage clownImage, int startX,int fixedY, int movementDelayInFrames){
    super(clownImage,bossclownFrightened, startX, fixedY, movementDelayInFrames);
    frightenedImage = bossclownFrightened;
  }
 
  @Override
  void spawnBallon(){
    if (random(90)>80){
    int col[] = {(int)random(255),(int)random(255),(int)random(255),255};
    if (random(100)>60)
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,800,5,5));
    else if (random(100)>99)
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,1000,5,6));
    else
    bloons.add(new Balloon(x,y+40,bloonSpeed,col,1500,5,7));
    }
  }

}
