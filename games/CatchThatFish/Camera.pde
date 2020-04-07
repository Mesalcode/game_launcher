class Camera{
  int positionX,positionY;
  Camera(int startPositionX, int startPositionY){
   positionX = startPositionX;
   positionY = startPositionY;
  }
  void move(int byX, int byY){
    positionX += byX;
    positionY += byY;
  }
  
}
