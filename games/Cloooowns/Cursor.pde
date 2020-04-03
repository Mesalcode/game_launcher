interface Cursor{
 void act(int x, int y); 
 void init();
}
class CursorHand implements Cursor{
 @Override
 void act(int x, int y){
   checkCollision(x,y);
 }
 @Override
 void init(){
   cursor(HAND);
 }
  void checkCollision(int mX, int mY){
 ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
 for (Balloon b : cloned){
   if (dist(mX,mY,b.getX(),b.getY())<b.rad)
     b.pop(1);
 }
 
}
}
class CursorScissors implements Cursor{
 @Override
 void act(int x, int y){
   checkCollision(x,y);
 }
 @Override
 void init(){
   cursor(scissorsImage);
 }
  void checkCollision(int mX, int mY){
 ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
 for (Balloon b : cloned){
   if (dist(mX,mY,b.getX(),b.getY())<b.rad)
     b.pop(2);
 }
 
}
}
class CursorFlame implements Cursor{
 @Override
 void init(){
   noCursor();
   cursor(flameImage, mouseX, mouseY);
 }
 @Override
 void act(int x, int y){
   imageMode(CENTER);
   ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
   for (Balloon b : cloned){
   if (dist(x,y,b.getX(),b.getY())<displayWidth/15)
     b.pop(1);
   }
   imageMode(CORNER);
 } 
}
class CursorTornado implements Cursor{
 @Override
 void init(){
   noCursor();
   cursor(tornadoImage, mouseX, mouseY);
 }
 @Override
 void act(int x, int y){
   imageMode(CENTER);
   ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
   for (Balloon b : cloned){
   if ((dist(x,y,b.getX(),b.getY())<displayWidth/10))
     b.nearer(x,y);
   if (dist(x,y,b.getX(),b.getY())<displayWidth/30)
     b.pop(5);
   }
   
   imageMode(CORNER);
 } 
}
