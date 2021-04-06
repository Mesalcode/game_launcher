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

class PlayerRenderer implements Renderer{
  Player toRender;
  PlayerRenderer(Player toRender){
    this.toRender = toRender;
  }
  void execute(){
   api.imageCentered(playerImage,toRender.position); 
   api._line(toRender.restPosition,toRender.positionStringEnd);
   api.imageCentered(toRender.bait.image,(int)toRender.positionStringEnd.x,(int)(toRender.positionStringEnd.y+toRender.bait.image.height/4));
   camera.assignCenter(api.new Position(displayWidth/2,toRender.positionStringEnd.y));
   if (DEBUG_SHOW_STRENGTH_INDICATORS){
     text("Stärke: " + toRender.bait.minStrength + "-" + toRender.bait.maxStrength, (float) toRender.positionStringEnd.x + (float) (toRender.bait.image.width / 2) + 20f, (float) toRender.positionStringEnd.y+ (toRender.bait.image.height / 2) + toRender.bait.image.height/4f);
   }  
}
}
