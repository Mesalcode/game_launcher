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
class Bait{
 PImage image;
 double minStrength,maxStrength,speed;
 
 Bait(PImage image, double minStrength, double maxStrength, double speed){
   this.image = image;
   this.minStrength = minStrength;
   this.maxStrength = maxStrength;
   this.speed = speed;
 }
 Bait(){}
 Bait noBait(){
  return new Bait(new PImage(),0,0.4,2); 
 }
 Bait smallBait(){
  return new Bait(api.resizeImagePercentual(loadImage("small_bait.png"),32,32),0.39,0.6,4);
 }
 Bait mediumBait(){
  return new Bait(api.resizeImagePercentual(loadImage("medium_bait.png"),42,42),0.5,0.8,6);
 }
 Bait bigBait(){
  return new Bait(api.resizeImagePercentual(loadImage("big_bait.png"),65,65),0.78,20,8);
 }
}
