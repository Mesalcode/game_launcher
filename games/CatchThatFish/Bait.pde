class Bait{
 PImage image;
 double minStrength,maxStrength,speed,maxDepth;
 Bait(PImage image, double minStrength, double maxStrength, double speed, double maxDepthPercentage){
   this.image = image;
   this.minStrength = minStrength;
   this.maxStrength = maxStrength;
   this.speed = speed;
   this.maxDepth = gWorldBorderY*api.decimal((float)maxDepthPercentage);
   println(api.decimal((float)maxDepthPercentage));
 }
 Bait(){}
 Bait noBait(){
  return new Bait(new PImage(),0,10,2,25); 
 }
 Bait smallBait(){
  return new Bait(api.resizeImagePercentual(loadImage("small_bait.png"),32,32),10,20,4,50);
 }
 Bait mediumBait(){
  return new Bait(loadImage("medium_bait.png"),20,30,6,70);
 }
 Bait bigBait(){
  return new Bait(loadImage("big_bait.png"),40,50,8,95);
 }
}
