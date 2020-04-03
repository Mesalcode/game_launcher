class Wolf{
 int posX = 0;
 Clown c;
 Wolf(Clown target){
   c = target;
   c.scare();
 }
 void chase(){
   posX+=8;
   c.chase();
   if (posX>displayWidth-30){
     wolfs.remove(this);
     clowns.remove(c);
     
   }
 }
 void animate(){
  image(wolfImage,posX,c.y+125);
   
 }
  
}
