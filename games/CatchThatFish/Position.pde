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
}
