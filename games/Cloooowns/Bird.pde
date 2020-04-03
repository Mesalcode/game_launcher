class Bird{
   int posX,posY,str;
   int startX,startY;
   boolean goingLeft;
   Balloon target;
   int speed;
   int min,max;
   PImage textureLeft, textureRight;
   Bird(int strenght, int speed, PImage textureLeft, PImage textureRight, int min, int max){
    posX=(int)random(displayWidth);
    posY=(int)random(displayHeight)-displayHeight/4;
    startX = posX;
    startY = posY;
    goingLeft = true;
    str = strenght;
    this.textureLeft = textureLeft;
    this.textureRight = textureRight;
    this.speed = speed;
    this.min = min;
    this.max = max;
   }
   void animate(){
     imageMode(CENTER);
     image(goingLeft ? textureLeft : textureRight,posX,posY);
     imageMode(CORNER);
   }
   
   void follow(){
    
    if (target.getX()>posX){
      posX+=speed;
      goingLeft = false; 
    }else {
      posX-=speed;
      goingLeft = true; 
    }
    if (target.getY()>posY){
      posY+=speed;
    }else {
      posY-=speed;
    }
    
     if (dist(posX,posY,target.getX(),target.getY())<target.rad/2)
       target.pop(str);
   }
   Balloon findTarget(){
    ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
    for (Balloon b : cloned){
     if (!b.chased & b.liv<=max & b.liv>=min)
       return b;
    }
    return null;
   }
   void search(){
     try {
     if (target==null||target.popped){
       
        target = findTarget();
        target.chase();
       
     }else
       follow();
     }catch (Exception e){
     if (dist(posX,posY,startX,startY)>2){
     if (startX>posX){
      posX+=speed;
      goingLeft = false; 
    }else {
      posX-=speed;
      goingLeft = true; 
    }
    if (startY>posY){
      posY+=speed;
    }else {
      posY-=speed;
    }
     }
     }
   }
}
