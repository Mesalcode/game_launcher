class Stash{
 private ArrayList<Fish> caughtFish;
 
 Stash(){
  caughtFish = new ArrayList<Fish>(); 
 }
 
 Fish[] getCaughtFish(){
  ArrayList<Fish> copyOfCaughtFish = (ArrayList<Fish>) caughtFish.clone();
  Fish[] caughtFishArray = new Fish[copyOfCaughtFish.size()];
  
  for (int i = 0; i < copyOfCaughtFish.size(); i++){
    caughtFishArray[i] = copyOfCaughtFish.get(i);
  }
  
  return caughtFishArray;
 }
 
 void add(Fish toAdd){
   caughtFish.add(toAdd);
 }
}
