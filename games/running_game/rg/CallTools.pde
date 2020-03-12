class CallTools{
 boolean isDead(Call toCheck){
  try {
   DeadCall a = (DeadCall) toCheck;
   return true;
  }catch (Exception e){
   return false; 
  }
 }
  
}
