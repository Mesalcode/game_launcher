class Bait{
 PImage image;
 double minStrength,maxStrength;
 Bait(PImage image, double minStrength, double maxStrength){
   this.image = image;
   this.minStrength = minStrength;
   this.maxStrength = maxStrength;
 }
 Bait(){}
 Bait noBait(){
  return new Bait(new PImage(),0,10); 
 }
 Bait smallBait(){
  return new Bait(loadImage("small_bait.png"),10,20);
 }
 Bait mediumBait(){
  return new Bait(loadImage("medium_bait.png"),20,30);
 }
 Bait bigBait(){
  return new Bait(loadImage("big_bait.png"),40,50);
 }
}
