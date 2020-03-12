class Wall{
  int boxStartX,boxStartY;
  int boxEndX,boxEndY;
  Wall(int boxSX,int boxSY,int boxEX,int boxEY){
    boxStartX = boxSX;
    boxStartY = boxSY;
    boxEndX = boxEX;
    boxEndY = boxEY;
  }
  void drawHitbox(){
   noFill();
   stroke(255,0,0);
   rect(boxStartX,boxStartY,boxEndX,boxEndY); 
   
  }
  int getSX(){
   return boxStartX; 
  }
  int getSY(){
   return boxStartY; 
  }
  int getWidth(){
   return boxEndX; 
  }
  int getHeight(){
    return boxEndY; 
  }
  
  
  
}
