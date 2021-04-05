class PlayerState{
 boolean isStringBeingRecovered;
 boolean isStringBeingAutoLowered;
 boolean isStringStatic;
 boolean isStringInTopPosition;
 boolean hasFishEscapedMidTow;
  
 PlayerState(){
   isStringBeingAutoLowered = false;
   isStringBeingRecovered = false;
   isStringStatic = false;
   isStringInTopPosition = true;
   hasFishEscapedMidTow = false;
 }
 
 void notifyRecoveryStarted(){
   if (isStringBeingRecovered){ //A fish has called this, because it escaped
    hasFishEscapedMidTow = true;
    return; 
   }
   
   isStringBeingAutoLowered = false;
   isStringBeingRecovered = true;
   isStringStatic = false;
   isStringInTopPosition = false;
 }
 
 void notifyRecovered(){
  isStringBeingAutoLowered = false;
  isStringBeingRecovered = false; 
  isStringStatic = false;
  isStringInTopPosition = true;
  hasFishEscapedMidTow = false;
 }
 
 void notifyStringDescentStarted(){
  isStringBeingAutoLowered = true;
  isStringBeingRecovered = false;
  isStringStatic = false;
  isStringInTopPosition = false;
  player.untarget();
 }
 
 void notifyDescentHasStopped(){
  if (hasFishEscapedMidTow){
    return;
  }
   
  isStringBeingAutoLowered = false;
  isStringBeingRecovered = false;
  isStringStatic = true;
  isStringInTopPosition = false;
 }
}
