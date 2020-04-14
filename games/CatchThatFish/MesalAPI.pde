class MesalAPI{
  void _translate(Position position){
      translate((float)position.x,(float)position.y);
  }
  void _camera(Position position){
     camera((float)position.x, (float)position.y, (displayHeight / 2) / tan(PI*30.0 / 180.0), (float)position.x, (float)position.y, 0, 0, 1, 0); 
  }
  void imageCentered(PImage image, int positionX, int positionY){
   imageMode(CENTER);
   image(image,positionX,positionY);
   imageMode(CORNER);
  }
  class Position{
   double x,y;
   Position(double x, double y){
    this.x = x;
    this.y = y;
   }
   void changeCoordinatesBy(double byX, double byY){
     this.x += byX;
     this.y += byY;
   }
   void resetCoordinates(){
    x = 0;
    y = 0;
   }
   boolean isResetted(){
    return x==0&y==0; 
   }
  }
}
