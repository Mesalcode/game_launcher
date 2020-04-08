class Fish{
 double positionX,positionY;
 int targetX, targetY;
 FishSettings settings;
 Fish(FishSettings settings){
   this.settings = settings;
   positionX = (int)random(0,4000);
   positionY = (int)random(600,4000);
 }
 void move(){
  
  if (targetX==0&targetY==0){
   targetX =  (int)random(0,4000-1)+1;
   targetY = (int)random(600,4000-1)+1;
  }
  if (dist((float)positionX,(float)positionY,targetX,targetY)<50){
    targetX = 0;
    targetY = 0;
  }else {
    if (targetX<positionX)
      positionX-=settings.abilityData.speed;
    else
      positionX+=settings.abilityData.speed;
    if (targetY<positionY)
      positionY-=settings.abilityData.speed;
    else
      positionY+=settings.abilityData.speed;
  }
 }
}
