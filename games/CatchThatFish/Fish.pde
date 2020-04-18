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
 Fish(FishSettings settings){
   this.settings = settings;
   position = new MesalAPI().new Position((int)random(0-(float)settings.abilityData.getNotOnScreenRange(),gWorldBorderX+(float)settings.abilityData.getNotOnScreenRange()),(int)random((float)settings.abilityData.getTopBorder(),(float)settings.abilityData.getBottomBorder()));
 }
 private void findTarget(){
   targetPosition = new MesalAPI().new Position(findNewTarget()[0],findNewTarget()[1]);
 }
 private FishOrientation selectOrientation(){
   return (api.oneDimensionalDist((int)position.x,(int)targetPosition.x)>=10 ? (targetPosition.x<position.x&targetPosition.y<position.y ? FishOrientation.LEFT_UP : (targetPosition.x<position.x&targetPosition.y>position.y ? orientation = FishOrientation.LEFT_DOWN : (targetPosition.x<position.x&targetPosition.y==position.y ? FishOrientation.LEFT : (targetPosition.x>position.x&targetPosition.y<position.y ? FishOrientation.RIGHT_UP : (targetPosition.x>position.x&targetPosition.y>position.y ? FishOrientation.RIGHT_DOWN: (targetPosition.x>position.x&targetPosition.y==position.y ? FishOrientation.RIGHT : FishOrientation.STANDBY)))))) : ((api.oneDimensionalDist((int)position.y,(int)targetPosition.y)>=10) ? (targetPosition.y>position.y ? FishOrientation.DOWN : FishOrientation.UP) : FishOrientation.STANDBY));
 }
 private void updateOrientationAndPosition(){
   orientation = changePositionByOrientation(selectOrientation());
 }
 private boolean hasReachedTarget(){
   return dist((float)position.x,(float)position.y,(float)targetPosition.x,(float)targetPosition.y)<gTargetReachedRange;
 }
 void act(){
  try {
    Command nextAction = (hasReachedTarget() ? (() -> findTarget()) : (() -> updateOrientationAndPosition()));
    nextAction.execute();
  }catch (NullPointerException targetUndefined){
    findTarget();
  }
 }
 private int createTargetX(){
   return (int)random(0-(float)settings.abilityData.getNotOnScreenRange(),gWorldBorderX+(float)settings.abilityData.getNotOnScreenRange());
 }
 private int createTargetY(){
   return (int)random((float)settings.abilityData.getTopBorder(),(float)settings.abilityData.getBottomBorder());
 }
 private int[] createTarget(){
  return new int[]{createTargetX(),createTargetY()};
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
