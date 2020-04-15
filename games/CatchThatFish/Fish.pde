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
class Fish{
 MesalAPI.Position position;
 MesalAPI.Position targetPosition;
 FishOrientation orientation;
 FishSettings settings;
 Fish(FishSettings settings){
   this.settings = settings;
   position = new MesalAPI().new Position((int)random(0,gWorldBorderX),(int)random(800,gWorldBorderY));
 }
 private void findTarget(){
   targetPosition = new MesalAPI().new Position(findNewTarget()[0],findNewTarget()[1]);
 }
 private FishOrientation selectOrientation(){
   return (oneDimensionalDist((int)position.x,(int)targetPosition.x)>=10 ? (targetPosition.x<position.x&targetPosition.y<position.y ? FishOrientation.LEFT_UP : (targetPosition.x<position.x&targetPosition.y>position.y ? orientation = FishOrientation.LEFT_DOWN : (targetPosition.x<position.x&targetPosition.y==position.y ? FishOrientation.LEFT : (targetPosition.x>position.x&targetPosition.y<position.y ? FishOrientation.RIGHT_UP : (targetPosition.x>position.x&targetPosition.y>position.y ? FishOrientation.RIGHT_DOWN: (targetPosition.x>position.x&targetPosition.y==position.y ? FishOrientation.RIGHT : FishOrientation.STANDBY)))))) : ((oneDimensionalDist((int)position.y,(int)targetPosition.y)>=10) ? (targetPosition.y>position.y ? FishOrientation.DOWN : FishOrientation.UP) : FishOrientation.STANDBY));
 }
 private void updateOrientationAndPosition(){
   orientation = changePositionByOrientation(selectOrientation());
 }
 private boolean hasReachedTarget(){
   return dist((float)position.x,(float)position.y,(float)targetPosition.x,(float)targetPosition.y)<50;
 }
 void move(){
  try {
    Command nextAction = (hasReachedTarget() ? (() -> findTarget()) : (() -> updateOrientationAndPosition()));
    nextAction.execute();
  }catch (NullPointerException targetUndefined){
    findTarget();
  }
 }
 private int oneDimensionalDist(int pos1, int pos2){
  return pos2-pos1 >= 0 ? pos2-pos1 : -(pos2-pos1);
 }
 private int[] findNewTarget(){
  return new int[]{(int)random(0,2000-1)+1,(int)random(800,7500-1)+1};
 }
 private void move(boolean down, boolean up, boolean left, boolean right){;
   position.changeCoordinatesBy((double)(left ? -settings.abilityData.speed : (right ? settings.abilityData.speed : 0)), (up ? -settings.abilityData.speed : (down ? settings.abilityData.speed : 0)));
 }
 private FishOrientation changePositionByOrientation(FishOrientation orientation){
    move(orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_DOWN||orientation==FishOrientation.RIGHT_DOWN||orientation==FishOrientation.DOWN),orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_UP||orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.RIGHT_UP||orientation==FishOrientation.UP)),orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_UP||orientation==FishOrientation.LEFT_DOWN||orientation==FishOrientation.LEFT),(orientation==FishOrientation.RIGHT_UP||orientation==FishOrientation.RIGHT_DOWN||orientation==FishOrientation.RIGHT));
    return orientation;
 }
}
