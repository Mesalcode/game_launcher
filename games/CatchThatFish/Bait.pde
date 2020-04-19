class Bait{
 PImage image;
 double minStrength,maxStrength,speed,maxDepth;
 Bait(PImage image, double minStrength, double maxStrength, double speed, double maxDepthPercentage){
   this.image = image;
   this.minStrength = minStrength;
   this.maxStrength = maxStrength;
   this.speed = speed;
   this.maxDepth = gWorldBorderY*maxDepthPercentage;
   println(maxDepth);
 }
 Bait(){}
 Bait noBait(){
  return new Bait(new PImage(),0,10,2,0.35); 
 }
 Bait smallBait(){
  return new Bait(api.resizeImagePercentual(loadImage("small_bait.png"),32,32),10,20,4,0.5);
 }
 Bait mediumBait(){
  return new Bait(loadImage("medium_bait.png"),20,30,6,0.7);
 }
 Bait bigBait(){
  return new Bait(loadImage("big_bait.png"),40,50,8,0.95);
 }
}
