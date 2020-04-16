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
class AbilityData{
  double strength,speed,size;
  boolean newVariant;
  private double topBorder,bottomBorder,notOnScreenRange;
  AbilityData(double strength, double speed, double size){
   this.strength = strength;
   this.speed = speed/2;
   this.size = size;
   newVariant = false;
  }
  AbilityData(double strength, double speed, double size, double topBorder, double bottomBorder, double notOnScreenRange){
    this.strength = strength;
    this.speed = speed/2;
    this.size = size;
    this.topBorder = topBorder;
    this.bottomBorder = bottomBorder;
    this.notOnScreenRange = notOnScreenRange;
    newVariant = true;
  }
  float getTopBorder(){
   return (float)topBorder*gWorldBorderY; 
  }
  float getBottomBorder(){
   return (float)bottomBorder*gWorldBorderY; 
  }
  float getNotOnScreenRange(){
   return (float)notOnScreenRange*gWorldBorderX; 
  }
}
