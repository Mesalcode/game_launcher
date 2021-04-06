import java.util.*;

class StashRenderer implements Renderer{
 Stash toRender;
 MesalAPI.Position renderPosition;
 
 StashRenderer(Stash toRender){
  this.toRender = toRender; 
  renderPosition = player.position.clone();
  renderPosition.changeCoordinatesBy(0, 15);
 }
 
 Fish[] invertUsingFor(Fish[] array) {
    for (int i = 0; i < array.length / 2; i++) {
        Fish temp = array[i];
        array[i] = array[array.length - 1 - i];
        array[array.length - 1 - i] = temp;
    }
    
    return array;
}
 
 void execute(){
  Fish[] caughtFish = toRender.getCaughtFish();
  int positionX = 0;
  int offsetY = 0;
  HashMap<Fish, MesalAPI.Position> caughtFishMap = new HashMap();
  
  for (Fish fish: caughtFish){
    MesalAPI.Position fishPosition = renderPosition.clone();
    fishPosition.changeCoordinatesBy(positionX, offsetY);
    caughtFishMap.put(fish, fishPosition);
    
    if (positionX < 180){
     positionX += 60; 
    }else{
     positionX = 0; 
     offsetY -= 30;
    }
  }
  
  for (Fish currentFishToRender: invertUsingFor(caughtFish)){
    MesalAPI.Position currentRenderPosition = caughtFishMap.get(currentFishToRender);
    api.imageCentered(currentFishToRender.settings.image, currentRenderPosition); 
  }
 }
}
