class Camera{
  int positionX,positionY;
  Camera(int startPositionX, int startPositionY){
   positionX = startPositionX;
   positionY = startPositionY;
  }
  void arrange(){
     camera(positionX, positionY, (displayHeight / 2) / tan(PI*30.0 / 180.0), positionX, positionY, 0, 0, 1, 0);
  }
  void move(int byX, int byY){
    positionX += byX;
    positionY += byY;
  }
}
