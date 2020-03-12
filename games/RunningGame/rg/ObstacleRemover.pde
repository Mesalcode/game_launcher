class ObstacleRemover{
  void act(Obstacle[] currentInstances){
    for (int index = 0; index < currentInstances.length;index++){
       if (currentInstances[index].posZ>despawnBorderZ){
          callManager.removeCall(callManager.getCalls()[index+1]);
       }
    }
    
  }
  
}
