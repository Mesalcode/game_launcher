class Rod{
 int maxDepth;
 Rod(int maxDepth){
   this.maxDepth = maxDepth;
 }
 Rod(){}
 Rod shallowRod(){
  return new Rod((int)(gWorldBorderY*0.95)); 
 }
}
