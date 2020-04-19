class Rod{
 int maxDepth;
 Rod(int maxDepth){
   this.maxDepth = maxDepth;
 }
 Rod(){}
 Rod shallowRod(){
  return new Rod((int)(gWorldBorderY*0.2)); 
 }
 Rod mediumRod(){
   return new Rod((int)(gWorldBorderY*0.5)); 
 }
 Rod goodRod(){
  return new Rod((int)(gWorldBorderY*0.7)); 
 }
 Rod bestRod(){
  return new Rod((int)(gWorldBorderY*0.95)); 
 }
}
