class Cat{
  Balloon target;
  int posX, posY;
  int regY;
  int rot=0;
  boolean chase = false;
  boolean goingLeft = true;
  Balloon findTarget(){
    ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
    for (Balloon b : cloned){
     if (!b.chased & b.getY()>displayHeight/3)
       return b;
    }
    return null;
   }
  Cat(){
    target = findTarget();
    if (target!=null)
      target.chase();
    posX = 50;
    posY = (int)(displayHeight/3*2.35);
    regY = posY;
  }
  void chase(){
   if (!chase){
   if (blackHoleActive)
     target=null;
   if (target==null||target.popped){
     if (posY==regY){
     target = findTarget();
     }
     else{
     posY+=8;
     if (goingLeft)
     rot = 270;
     else
     rot = 90;
     }
   }else {
     target.chase();
     if (target.getX()>posX+10){
       posX+=6;
       goingLeft = false;
       
     }
     else if (target.getX()<posX-10){
       posX-=6;   
      goingLeft = true; 
     }
     else {
      if (posY>target.getY()+target.rad){
        posY-=8;
        if (goingLeft)
        rot=90;
        else
        rot=270;
        ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
        for (Balloon b : cloned){
           if (dist(b.getX(),b.getY(),posX,posY)<displayWidth/20)
             b.pop(500);
         
        }
      }else{
       target.pop(500);
     }
       
     }
   }
   }else if (posY!=regY){
     posY+=8;
     
   }
  }
  void runAway(){
  chase = true;
  posX+=8;
  goingLeft = false;
 }
  void animate(){
   pushMatrix();
   imageMode(CENTER);
   translate(posX,posY);
   if (posY!=regY)
   rotate(radians(rot));
   if (goingLeft)
   image(catLeftImage,0,0); 
   else
   image(catRightImage,0,0); 
   
   imageMode(CORNER);
   popMatrix();
  }
  
  
  
  
  
  
  
  
  
  
  
  
}
