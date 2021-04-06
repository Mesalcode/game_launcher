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
import java.util.Arrays;
class Fish{
 MesalAPI.Position position;
 MesalAPI.Position targetPosition;
 FishOrientation orientation;
 FishSettings settings;
 float targetMinX,targetMaxX,targetMinY,targetMaxY;
 boolean followingBait, attachedToBait, stashed;
 int detectionRadius;
 String debugInfo;
 boolean ignoresBait;
 
 Fish(FishSettings settings){
   this.settings = settings;
   position = new MesalAPI().new Position((int)random(0-(float)settings.abilityData.getNotOnScreenRange(),gWorldBorderX+(float)settings.abilityData.getNotOnScreenRange()),(int)random((float)settings.abilityData.getTopBorder(),(float)settings.abilityData.getBottomBorder()));
   targetMinX = 0-(float)settings.abilityData.getNotOnScreenRange();
   targetMaxX = gWorldBorderX+(float)settings.abilityData.getNotOnScreenRange();
   targetMinY = (float)settings.abilityData.getTopBorder();
   targetMaxY = (float)settings.abilityData.getBottomBorder();
   followingBait = false;
   attachedToBait = false;
   detectionRadius = gBaitDetectionRadius;
   debugInfo = "";
   ignoresBait = false;
 }
 
boolean isBaitNearby(){
  return (float) api.oneDimensionalDist((int) position.x, (int) player.positionStringEnd.x) < (float) detectionRadius && 
  (float) api.oneDimensionalDist((int) position.y, (int) player.positionStringEnd.y) < (float) detectionRadius; 
 }
 
 private boolean isHungry(){
   if (DEBUG_FISH_ARE_ALWAYS_HUNGRY){
    return true; 
   }
   
   float rb1 = 600 * 30; 
   float rv1 = random(rb1);
   float rb2 = (float) player.bait.maxStrength * 0.75;
   rb2 = rb2 > settings.abilityData.strength ? (float) settings.abilityData.strength * 0.75 : rb2; 
   float rv2 = 10 + 4 * (float) (settings.abilityData.strength - rb2); 
   
   return rv1 <= rv2;
 }
 
 private boolean isInterestedInBait(){
   return settings.abilityData.strength <= player.bait.maxStrength && settings.abilityData.strength >= player.bait.minStrength && isHungry();
 }
 
 private boolean shouldStartFollowingBait(){
  return isBaitNearby() && isInterestedInBait() && !ignoresBait && !player.state.isStringBeingAutoLowered && !player.state.isStringBeingRecovered;
 }

 private void findTarget(){
   targetPosition = new MesalAPI().new Position(findNewTarget()[0],findNewTarget()[1]);
 }
 private FishOrientation selectOrientation(MesalAPI.Position tPosition){
   return (api.oneDimensionalDist((int)position.x,(int)tPosition.x)>=10 ? (tPosition.x<position.x&tPosition.y<position.y ? FishOrientation.LEFT_UP : (tPosition.x<position.x&tPosition.y>position.y ? orientation = FishOrientation.LEFT_DOWN : (tPosition.x<position.x&tPosition.y==position.y ? FishOrientation.LEFT : (tPosition.x>position.x&tPosition.y<position.y ? FishOrientation.RIGHT_UP : (tPosition.x>position.x&tPosition.y>position.y ? FishOrientation.RIGHT_DOWN: (tPosition.x>position.x&tPosition.y==position.y ? FishOrientation.RIGHT : FishOrientation.STANDBY)))))) : ((api.oneDimensionalDist((int)position.y,(int)tPosition.y)>=10) ? (tPosition.y>position.y ? FishOrientation.DOWN : FishOrientation.UP) : FishOrientation.STANDBY));
 }
 private void updateOrientationAndPosition(){
   orientation = changePositionByOrientation(selectOrientation(targetPosition));
 }
 private boolean hasReachedTarget(){
   return dist((float)position.x,(float)position.y,(float)targetPosition.x,(float)targetPosition.y)<gTargetReachedRange;
 }
 
 private boolean hasReachedBait(){
   return dist((float)position.x,(float)position.y,(float)player.positionStringEnd.x,(float)player.positionStringEnd.y)<gTargetReachedRange;
 }
 
private void followBait(){
  orientation = changePositionByOrientation(selectOrientation(player.positionStringEnd));
}

private boolean willDetach(){
 float cv1 = 0.05; //chance base
 float cv2 = 100 / cv1 / 100;
 float rb1 = 600 * cv2; //*1 is temporary to make it less frustrating to test
 float rv1 = random(rb1);
 float rb2 = (float) player.bait.maxStrength * 0.75; //3 times the impact
 rb2 = rb2 > settings.abilityData.strength ? (float) settings.abilityData.strength * 0.75 : rb2; //Optional, may need to be removed
 float rv2 = 10 + 4 * (float) (settings.abilityData.strength - rb2) * 5; //The higher the strength, the higher the chance of flight - the higher the bait strength, the lower the chance of flight
 debugInfo = "Flucht-Wahrscheinlichkeit (pro Sekunde): " + ((rv2 / rb1) * 100 * 60) + "%";  
 
 
 return rv1 <= rv2;
}
 
 void act(){
   //Temporary
   if (player.state.isStringInTopPosition && attachedToBait){
     stashed = true;  //Stashed is read by the renderer so that it can remove itself from the list
     fishs.remove(this); //the fish removes itself from the global action list
     player.unattach();
     
     Fish replacementFish = new Fish(settings); //Create a new fish with identical settings somewhere on the map
     fishs.add(replacementFish); //add it to the global action list
     
     FishRenderer replacementRenderer = new FishRenderer(replacementFish); //create a renderer for the replacement  fish
     renderers.add(replacementRenderer); //add it to the renderer list
     
     stash.add(this); //Add self to stash
     
     System.gc(); //Clean up
     
     return;
   }
   //
  if (attachedToBait){
   if (willDetach()){
    debugInfo = "";
    //ignoresBait = true; 
    player.state.notifyRecoveryStarted();
    attachedToBait = false;
    followingBait = false;
    Command nextAction = (hasReachedTarget() ? (() -> findTarget()) : (() -> updateOrientationAndPosition()));
    nextAction.execute();
   }else {
     position.x = player.positionStringEnd.x; 
     position.y = player.positionStringEnd.y + settings.image.height * 0.75f; 
   }
   return;
  }
  
  if (followingBait){
    if (!isBaitNearby()){ 
     player.untarget();
     followingBait = false;
     act();
     return; 
    }
    
    if (hasReachedBait()){
      followingBait = false;
      attachedToBait = true;
      player.attach(); //notify the player
      act();
      return;
    }
    followBait();
    return;
  }
  
  if (shouldStartFollowingBait()){
   if (player.tryToTarget()){
    followingBait = true; 
    act();
    return;
   }
  }
   
  try {
    Command nextAction = (hasReachedTarget() ? (() -> findTarget()) : (() -> updateOrientationAndPosition()));
    nextAction.execute();
  }catch (NullPointerException targetUndefined){
    findTarget();
  }
 }
 
 private int[] createTarget(){
  return new int[]{(int)random(targetMinX,targetMaxX),(int)random(targetMinY,targetMaxY)};
 }
 private boolean validateTarget(int[] newTarget){
   return api.oneDimensionalDist(newTarget[0],(int)position.x)<gWorldBorderX*gMaxTargetDistanceInDisplayRelativeSize;
 }
 private int[] findNewTarget(){
  int[] newTarget = createTarget();
  return validateTarget(newTarget) ? newTarget : findNewTarget();
 }
 private void move(boolean down, boolean up, boolean left, boolean right){;
   position.changeCoordinatesBy((double)(left ? -settings.abilityData.speed : (right ? settings.abilityData.speed : 0)), (up ? -settings.abilityData.speed : (down ? settings.abilityData.speed : 0)));
 }
 private FishOrientation changePositionByOrientation(FishOrientation orientation){
    move(orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_DOWN||orientation==FishOrientation.RIGHT_DOWN||orientation==FishOrientation.DOWN),orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_UP||orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.RIGHT_UP||orientation==FishOrientation.UP)),orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_UP||orientation==FishOrientation.LEFT_DOWN||orientation==FishOrientation.LEFT),(orientation==FishOrientation.RIGHT_UP||orientation==FishOrientation.RIGHT_DOWN||orientation==FishOrientation.RIGHT));
    return orientation;
 }
}
