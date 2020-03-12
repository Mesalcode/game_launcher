void settings(){
    size(1620,900);
}
void setup(){

   background(150);
 surface.setTitle("Zeichentool von Alexander Mertens");
 setBrushSize(15);
 setBrushColor(0,0,0);
 setMaxBrushSize(500);
 refreshFilled();
    Tool currentTool =hotbarTools[selectedTool]; 
        currentTool.activate();
       cursor(currentTool.getCursor());
       save("Zwischenablage/save" + saveStatus + ".png");
       saveStatus++;
      
     
}
