void undo(){
  
  if (saveStatus>=delCount){
  File toDelete = new File(sketchPath("cache/save"+(saveStatus)+".png"));
  if (toDelete.exists())
  toDelete.delete();
  if (!(saveStatus==delCount)){
    if (saveStatus>2)
 saveStatus-=2;
  else 
  saveStatus=0;
  enableOnClick = true;
  image(loadImage("cache/save"+(saveStatus)+".png"),0,0);
  
  }else {
   
  }
  }
}
