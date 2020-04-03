interface Ability{
 void exec(); 
}
class Magic implements Ability{
 @Override
 void exec(){
   magicSound.trigger();
   ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
   for (Balloon b : cloned){
     if (b.getY()<displayHeight-displayHeight/5){
       b.pop(b.liv);
     }
   }
 }
}
class Wind implements Ability{
 @Override
 void exec(){
   windSound.trigger();
   ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
   for (Balloon b : cloned){
     if (b.getY()<displayHeight-displayHeight/2){
       b.sink(displayHeight/4);
     }
   }
 }
}
class Blackhole implements Ability{
  @Override
  void exec(){
   blackHoleSound.trigger(); 
   blackHoleActive = true;
   abilityAnimationLength = (int)frameRate*11;
   
   
  }
  
  
  
}
class WolfChase implements Ability{
  @Override
  void exec(){
    if (!allChased()){
      wolfs.add(new Wolf(findTarget()));
     
    }
  }
  
}
class GhostKidnapping implements Ability{
  @Override
  void exec(){
    if (!allChased()){
      ghosts.add(new Ghost(findTarget()));
    }
  }
  
}
boolean allChased(){
  int free = 0;
 for (int i = 0; i < clowns.size();i++){
   if (!(clowns.get(i)).chase)
     free++;
 }
 if (free>1)
   return false;
 return true;
}
 boolean allChasedC(){
  int free = 0;
 for (int i = 0; i < cats.size();i++){
   if (!(cats.get(i)).chase)
     free++;
 }
 if (free>1)
   return false;
 return true;
}
Clown findTarget(){
 
 Clown c = clowns.get((int)random(clowns.size()-1));
 if (c.chase)
   return findTarget();
 else
   return c;
  
}
Cat findTargetC(){
 
 Cat c = cats.get((int)random(cats.size()-1));
 if (c.chase)
   return findTargetC();
 else
   return c;
  
}
