class Player{
 MesalAPI.Position position;
 Bait bait;
 Rod rod;
 MesalAPI.Position restPosition;
 MesalAPI.Position positionStringEnd;
 private boolean isTargeted = false;
 
 PlayerState state;
 
 Player(){
   position = api.new Position(gWorldBorderX/2,gLandScapeEndY+gBoatOffset);
   bait = new Bait().mediumBait();
   rod = new Rod().mediumRod();
   restPosition = api.new Position(position.x-playerImage.width/2,position.y-playerImage.height/2);
   positionStringEnd = restPosition.clone();
   state = new PlayerState();
 }
 
 boolean canRecover(){
   return positionStringEnd.y-bait.speed>=restPosition.y;  
 }
 
 boolean canSink(){
  return positionStringEnd.y+bait.speed<=rod.maxDepth;  
 }
 
 Bait getBait(){
  return bait; 
 }
 
 boolean tryToTarget(){
  if (isTargeted){
   return false; 
  }
  
  isTargeted = true;
  return true;
 }
 
 void untarget(){
  isTargeted = false; 
 }
 
 boolean debugIsTargeted(){
  return isTargeted; 
 }
 
 //Lifecycle / movement
 
 void reactToButtonPress(){
   if (key == ' '){
     if (state.isStringBeingAutoLowered){
       state.notifyDescentHasStopped();
     }else if (state.isStringInTopPosition){
       state.notifyStringDescentStarted();
     }else if (state.isStringStatic){
      state.notifyRecoveryStarted(); 
     }
   }
 }
 
 void reactToButtonRelease(){
   if (key == ' '){
     if (state.isStringBeingRecovered){
      state.notifyDescentHasStopped(); //In reality, there was no descent but an ascent
     }
   }
 }
 
 void act(){
   if (state.isStringBeingAutoLowered){
     if (!canSink()){
      state.notifyDescentHasStopped();
      return;
     }
     positionStringEnd.changeCoordinatesBy(0, bait.speed);
   }else if (state.isStringBeingRecovered){
    println("recovering");
    if (!canRecover()){
     positionStringEnd = restPosition.clone(); 
     state.notifyRecovered();
     return;
    }
    
    positionStringEnd.changeCoordinatesBy(0, -bait.speed); 
   }
 }
}
