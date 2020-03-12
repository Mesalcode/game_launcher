class ObstacleTools{
 Obstacle[] buildListFromCalls(ObstacleCall[] calls){
   Obstacle[] returnVal = new Obstacle[calls.length];
   int index = 0;
   for (ObstacleCall oc : calls){
     returnVal[index] = oc.getReference();
     index++;
   }
   return returnVal;
 }
}
