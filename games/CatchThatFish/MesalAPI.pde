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
class MesalAPI{
  void _translate(Position position){
      translate((float)position.x,(float)position.y);
  }
  void _camera(Position position){
     camera((float)position.x, (float)position.y, (displayHeight / 2) / tan(PI*30.0 / 180.0), (float)position.x, (float)position.y, 0, 0, 1, 0); 
  }
  void imageCentered(PImage image, int positionX, int positionY){
   imageMode(CENTER);
   image(image,positionX,positionY);
   imageMode(CORNER);
  }
  class Position{
   double x,y;
   Position(double x, double y){
    this.x = x;
    this.y = y;
   }
   void changeCoordinatesBy(double byX, double byY){
     this.x += byX;
     this.y += byY;
   }
   void resetCoordinates(){
    x = 0;
    y = 0;
   }
   boolean isResetted(){
    return x==0&y==0; 
   }
  }
}
