class Player{
 int posX,posY,posZ;
 float velocityY = 0;
 float gravity;
 int groundY;
 float scale;
 float jumpHeight;
 PShape shape,jumpShape,slideShape;
 int possSpeedX;
 boolean sliding = false;
 int slideLength;
 int slideCount = 0;
 int[] movementFieldX;
 int offsetY;
 Player(int startX,int startY,int startZ,float scale, PShape playerShape,PShape jumpShape,PShape slideShape,float gravity,int possibleSpeedX, float jumpHeightY, int slideDuration, int[] movementFieldX, int offsetY){
   posX=startX;
   posY=startY;
   posZ=startZ;
   shape=playerShape;
   this.scale = scale;
   groundY = startY;
   this.gravity = gravity;
   possSpeedX = possibleSpeedX;
   jumpHeight = jumpHeightY;
   this.jumpShape = jumpShape;
   this.slideShape = slideShape;
   slideLength = slideDuration;
   this.movementFieldX = movementFieldX;
   this.offsetY = offsetY;
 }
 void animate(){
    
    translate(posX,posY,posZ); //x y z
    scale(scale);
    if (!sliding){
    if (posY>=groundY-10)
    shape(shape,0,offsetY);
    else{
     shape(jumpShape,0,offsetY); 
    }
    }else {
      shape(slideShape,0,offsetY);
      if (slideCount<slideLength)
        slideCount++;
      else{
        sliding = false;
        slideCount = 0;
      }
   }
  
 }
 boolean checkCollision(){
   Call[] obstacleCalls = callsFromSecond(callManager.getCalls());
   for (Call currCall : obstacleCalls){
      ObstacleCall oc = ((ObstacleCall) currCall);
      Obstacle ob = oc.getReference();
     /* println("tiefe-objekt:"+String.valueOf(ob.obstacleShape.getDepth()));
      println("vorne-objekt:"+String.valueOf(ob.posZ+ob.obstacleShape.getDepth()/2));
      println("hinten-objekt:"+String.valueOf(ob.posZ-ob.obstacleShape.getDepth()/2)); */
      if (ob.posZ+(ob.obstacleShape.getDepth()/2)*20>=posZ&&ob.posZ-(ob.obstacleShape.getDepth()/2)*20<=posZ){
        println("collision"); 
        return true;
      }
   }
   return false;
 }
 private Call[] callsFromSecond(Call[] toTrim){
   Call[] returnVal = new Call[toTrim.length-1];
   for (int i = 1; i < toTrim.length;i++){
    returnVal[i-1] = toTrim[i]; 
   }
   return returnVal;
 }
 void calculateGravity(){
   boolean grounded = posY>=groundY;
  
   if (!grounded){
    posY+=velocityY;
    velocityY+=gravity;
   }else{
    if (velocityY<0)
      posY+=velocityY;
    else
      velocityY=0;
    
   }
   
 }
 void jump(){
   if (velocityY==0){
     velocityY = jumpHeight;
     sliding = false;
     slideCount = 0;
     
   }
 }
 void goLeft(){
   if (posX-possSpeedX>=movementFieldX[0])
   posX-=possSpeedX;
 }
 void goRight(){
  if (posX+possSpeedX<=movementFieldX[1])
  posX+=possSpeedX;
 }
 void slide(){
   if (velocityY==0&&!sliding){
     sliding = true;
   
   }
 }
  
  
}
