class Mouse{
 int posX = 0;
 Cat c;
 Mouse(Cat target){
   c = target;
 }
 void chase(){
   posX+=8;
   if (c.target!=null){
     c.target=null;
   }
   if (posX>c.posX+200)
     c.runAway();
   else if (c.posY==c.regY)
     c.goingLeft=true; 
   if (c.posX>displayWidth-20){
     mice.remove(this);
     cats.remove(c);
   }
 }
 void animate(){
  image(mouseImage,posX,c.posY);
   
 }
  
}
