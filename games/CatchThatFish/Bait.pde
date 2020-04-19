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
  return new Bait(new PImage(),0,1,2); 
 }
 Bait smallBait(){
  return new Bait(api.resizeImagePercentual(loadImage("small_bait.png"),32,32),1,2,4);
 }
 Bait mediumBait(){
  return new Bait(api.resizeImagePercentual(loadImage("medium_bait.png"),42,42),2,4,6);
 }
 Bait bigBait(){
  return new Bait(api.resizeImagePercentual(loadImage("big_bait.png"),65,65),4,20,8);
 }
}
