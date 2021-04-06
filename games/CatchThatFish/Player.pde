/*
MIT License

Copyright (c) 2020 Alexander Mertens

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
   bait = new Bait().bigBait();
   rod = new Rod().bestRod();
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
    if (!canRecover()){
     positionStringEnd = restPosition.clone(); 
     state.notifyRecovered();
     return;
    }
    
    positionStringEnd.changeCoordinatesBy(0, -bait.speed); 
   }
 }
}
