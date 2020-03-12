class Coin{
  int positionX,positionY;
  boolean eaten = false;
  
  Coin(int spawnX,int spawnY){
    positionX = spawnX;
    positionY = spawnY;
  }
  void animate(){
    boolean et = eaten;
    if (!eaten){
    image(coinImage,positionX,positionY);
   
    if (positionX-pacman.getX()>-28&&positionX-pacman.getX()<28&&positionY-pacman.getY()<28&&positionY-pacman.getY()>-28)
      eaten = true;
      
      
    }
    if (et!=eaten){
       points+=10; 
    }
  }
  
  
  
  
  
  
  
  
  
  
  
}
