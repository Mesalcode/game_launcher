
class Player{
  int posX,posY;
  int hitboxSX,hitboxSY,hitboxEX,hitboxEY;
  int direction = Directions.UP;
  int hitboxWidth,hitboxHeight;
  
  Player(int spawnX,int spawnY,int hitboxWidth,int hitboxHeight){
    posX=spawnX;
    posY=spawnY;
    this.hitboxWidth = hitboxWidth;
    this.hitboxHeight = hitboxHeight;
  }
  void animate(){
     PImage playerImage = loadImage("player_up.png");
     if (direction==Directions.RIGHT)
       playerImage = loadImage("player_right.png");
     else if (direction==Directions.LEFT)
       playerImage = loadImage("player_left.png");
     else if (direction==Directions.DOWN)
       playerImage = loadImage("player_down.png");
     
    
       
       
     image(playerImage,posX,posY); 
  }
  void move(int velX,int velY){
   if (!isIntersectingWall(posX+hitboxWidth/2+velX,posY+hitboxWidth/2+velY)){
   posX+=velX;
   posY+=velY;
  }
   if (velX==0&&velY>=0)
     direction = Directions.DOWN;
   else if (velX==0&&velY<=0)
     direction = Directions.UP;
   else if (velX<=0&&velY==0)
     direction = Directions.LEFT;
   else{
     direction = Directions.RIGHT;
   }
   hitboxSX = posX+hitboxWidth/10;
   hitboxSY = posY+hitboxHeight/10;
   hitboxEX = hitboxWidth;
   hitboxEY = hitboxHeight;
  }
  void drawHitbox(){
    noFill();
    rect(hitboxSX,hitboxSY,hitboxEX,hitboxEY);
    
  }
  boolean isIntersectingWall(int futurePositionX,int futurePositionY){
    int contactX1,contactX2,contactX3,contactX4;
    int contactY1,contactY2,contactY3,contactY4;
    contactX1 = futurePositionX-hitboxWidth/2;
    contactY1 = futurePositionY-hitboxWidth/2;
    contactX2 = futurePositionX+hitboxWidth/2;
    contactY2 = futurePositionY+hitboxWidth/2;
    contactX3 = futurePositionX+hitboxWidth/2;
    contactY3 = futurePositionY-hitboxWidth/2;
    contactX4 = futurePositionX-hitboxWidth/2;
    contactY4 = futurePositionY+hitboxWidth/2;
    for (Wall currentWall : walls){
     
      if (
      (contactX1 > currentWall.getSX() && contactX1 < currentWall.getSX()+currentWall.getWidth() &&  
        contactY1 > currentWall.getSY() && contactY1 < currentWall.getSY()+currentWall.getHeight())
        || (contactX2 > currentWall.getSX() && contactX2 < currentWall.getSX()+currentWall.getWidth() &&  
        contactY2 > currentWall.getSY() && contactY2 < currentWall.getSY()+currentWall.getHeight())
        || (contactX3 > currentWall.getSX() && contactX3 < currentWall.getSX()+currentWall.getWidth() &&  
        contactY3 > currentWall.getSY() && contactY3 < currentWall.getSY()+currentWall.getHeight())
        || (contactX4 > currentWall.getSX() && contactX4 < currentWall.getSX()+currentWall.getWidth() &&  
        contactY4 > currentWall.getSY() && contactY4 < currentWall.getSY()+currentWall.getHeight())
        ) {
        
        return true; 
  
        }
    }
   return false; 
  }
  int getX(){
   return posX; 
  }
  int getY(){
   return posY; 
  }
  
  
  
  
}
