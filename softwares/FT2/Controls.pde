
void draw(){
 
 
 

  
  if (previewCount<previewRenderDelay){
    previewCount++;
   
  }else{
  Tool currentTool =hotbarTools[selectedTool]; 
  currentTool.showPreview();
  previewCount = 0;
  }
  
 
}
void mousePressed(){
  
  Tool currentTool =hotbarTools[selectedTool]; 
  currentTool.use(); 
   
}
void mouseMoved(){
  
   if (drawFocused){
  try {
   if (enableOnClick)
  image(loadImage("Zwischenablage/save"+saveStatus+".png"),0,0);enableOnClick=false;
  }catch (Exception e){
  }
   }
    try {
   if (clearOnClick)
    background(150);clearOnClick=false;
  }catch (Exception e){
  }
   
   
   try {
   if (loadOnClick)
   image(loadedImage,(width-loadedImage.width)/2,(height-loadedImage.height)/2);loadOnClick=false;
  }catch (Exception e){
 }
   }


void mouseDragged(){
  if (drawFocused){
Tool currentTool =hotbarTools[selectedTool]; 
 if (currentTool.dragable){
  currentTool.use(); 
 }
  }
}

void keyPressed(){
 if (key=='t'){
   
    toolbar = new Toolbar();
 }else if (key =='+'){
  setBrushSize(brushSize+1); 
 }else if (key=='-'){
   setBrushSize(brushSize-1); 
 }else if (key =='c'){
   getUserColor();
 }else if (key =='f'){
   toggleFilling();
 }else if (key =='g'){
    hotbarTools[selectedTool].onSwitch();
    if (selectedTool<hotbarTools.length-1)
    selectedTool++;
    else
    selectedTool=0;
   hotbarTools[selectedTool].init();
    hotbarTools[selectedTool].activate();
    cursor( hotbarTools[selectedTool].getCursor());
 }else if (key =='z'){
    undo();
 }else if (key=='o')
 loadImage();
    else if (key=='s'){
       String userName = showInputDialog(null,"Wie möchten sie ihr Bild benennen?");
   if (userName!=null){
   try {
   save("Meine Bilder/"+  userName + ".png");
     showMessageDialog(null,"Ihr Bild wurde unter ,," + userName + ".png\" gespeichert." );
   }catch (Exception e2){
       showMessageDialog(null,"Ungültiger Dateiname!","Fehler",ERROR_MESSAGE );
     
   }
  
        }
    }
}
 
   
