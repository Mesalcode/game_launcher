class ArrayTools{
 Object[] splitArray(Object[][] toSplit){
   int targetLength = toSplit.length;
   Object[] out1 = new Object[targetLength];
   Object[] out2 = new Object[targetLength];
   for (int i = 0; i < targetLength;i++){
     out1[i] = toSplit[i][0];
     out2[i] = toSplit[i][1];
   }
   Object[] returnValue = {out1,out2};
   return returnValue;
 }
 Object[][] combineArray(Object[] toCombine1,Object[] toCombine2){
  Object[][] combined = new Object[toCombine1.length][2];
  for (int i = 0; i < toCombine1.length;i++){
   combined[i][0] = toCombine1[i];
   combined[i][1] = toCombine2[i];
  }
  return combined;
 }
 float[] stringToInt(String[] toMassParse){
   int parseMaterialLength = toMassParse.length;
   float[] returnVal = new float[parseMaterialLength];
   for (int i = 0; i < parseMaterialLength;i++){
     returnVal[i] = Float.parseFloat(toMassParse[i]);
   }
   return returnVal;
 }
 Object[] floatToObject(float[] toMassParse){
   int parseMaterialLength = toMassParse.length;
   Object[] returnVal = new Object[parseMaterialLength];
   for (int i = 0; i < parseMaterialLength;i++){
     returnVal[i] = (Object)(toMassParse[i]);
   }
   return returnVal;
 }
 ObstacleCall[] subArrayObjectCalls(Call[] toSub,int subStart,int subEnd){
  ObstacleCall[] returnVal = new ObstacleCall[toSub.length];
  int j = 0;
  for (int i = subStart;i < subEnd+1;i++){
   returnVal[j] = (ObstacleCall)toSub[i];
   j++;
  }
  return returnVal;
 }
}
