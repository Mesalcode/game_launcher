class Enemy{
 int posX,posY;
 PImage image;
 Enemy(int startX,int startY, PImage image){
  posX = startX;
  posY = startY;
  this.image = image;
 }
 void animate(){
   image(image,posX,posY);
   
 }
  
  
}
