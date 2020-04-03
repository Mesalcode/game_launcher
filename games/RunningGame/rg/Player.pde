class Player{
 Position position;
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
 /*Player(Position startPosition,float scale, PShape playerShape,PShape jumpShape,PShape slideShape,float gravity,int possibleSpeedX, float jumpHeightY, int slideDuration, int[] movementFieldX, int offsetY){
   position=startPosition;
   shape=playerShape;
   this.scale = scale;
   groundY = startPosition.y; //TODO: Change to global variable
   this.gravity = gravity;
   possSpeedX = possibleSpeedX;
   jumpHeight = jumpHeightY;
   this.jumpShape = jumpShape;
   this.slideShape = slideShape;
   slideLength = slideDuration;
   this.movementFieldX = movementFieldX;
   this.offsetY = offsetY;
 }*/
 Player(PlayerInfoContainer information){
   position = information.startPosition;
   shape = information.runShape;
   scale = information.scale;
   groundY = information.startPosition.y; //TODO: Change to global variable
   gravity = information.gravity;
   possSpeedX = information.possibleSpeedX;
   jumpHeight = information.jumpHeightY;
   jumpShape = information.jumpShape;
   slideShape = information.slideShape;
   slideLength = information.slideDuration;
   movementFieldX = information.movementFieldX;
   offsetY = information.offsetY;
 }
 void animate(){
    
    translate(position.x,position.y,position.z); //x y z
    scale(scale);
    if (!sliding){
    if (position.y>=groundY-10)
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
      if (ob.posZ+(ob.obstacleShape.getDepth()/2)*20>=position.z&&ob.posZ-(ob.obstacleShape.getDepth()/2)*20<=position.z){
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
   boolean grounded = position.y>=groundY;
  
   if (!grounded){
    position.y+=velocityY;
    velocityY+=gravity;
   }else{
    if (velocityY<0)
      position.y+=velocityY;
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
   if (position.x-possSpeedX>=movementFieldX[0])
     position.x-=possSpeedX;
 }
 void goRight(){
  if (position.x+possSpeedX<=movementFieldX[1])
    position.x+=possSpeedX;
 }
 void slide(){
   if (velocityY==0&&!sliding){
     sliding = true;
   
   }
 }
  
  
}
