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
class FishRenderer implements Renderer{
  Fish toRender;
  FishRenderer(Fish toRender){  this.toRender = toRender;  }
  @Override
  void execute(){
    pushMatrix();
    api._translate(toRender.position);
    if (!toRender.attachedToBait){
      Command adjustGraphicsToOrientation = toRender.orientation==FishOrientation.LEFT||toRender.orientation==FishOrientation.LEFT_DOWN||toRender.orientation==FishOrientation.LEFT_UP ? () -> scale(-1,1) : (toRender.orientation==FishOrientation.UP ? () -> rotate(radians(-90)) : (toRender.orientation==FishOrientation.DOWN ? () -> rotate(radians(90)) : () -> {}));
      adjustGraphicsToOrientation.execute();
    }else {
      rotate(radians(-90));
    }
    api.imageCentered(toRender.settings.image,0,0);
    
    if (DEBUG_DRAW_DETECTION_INDICATORS){
      noFill();
      
      if (toRender.followingBait){
       stroke(255, 0, 0); 
      }else if (toRender.attachedToBait){
       stroke(0, 0, 255);
      }else if (toRender.shouldStartFollowingBait()){
       stroke(255, 255, 0); 
      }else if (toRender.isBaitNearby()){
       stroke(0, 255, 0); 
      }else {
       stroke(0);
      }
      
      circle(0, 0, toRender.settings.image.width);
    }
    
    popMatrix();
    pushMatrix();
    if (DEBUG_SHOW_STRENGTH_INDICATORS){
      api._translate(toRender.position);
      text("Stärke: " + toRender.settings.abilityData.strength, toRender.settings.image.width + 20, 0);
    }
    if (DEBUG_SHOW_OBJECT_SPECIFIC_DETAILS){
      text(toRender.debugInfo, toRender.settings.image.width + 20, 10);
    }
    popMatrix();
  }
}
