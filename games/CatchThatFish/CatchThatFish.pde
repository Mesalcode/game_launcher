WaterRenderer waterRenderer;
Camera camera;
int[] gWaterColor;

void setup(){
 frameRate(30);
 fullScreen(P3D);
 initializeGlobalVariables();
 initializeRenderers();
 camera = new Camera(displayWidth/2,displayHeight/2);
}
void initializeGlobalVariables(){
 gWaterColor = new int[]{0,0,125,40};
}
void initializeRenderers(){
 waterRenderer = new WaterRenderer(0,600,2000,5000,gWaterColor); 
}
void draw(){
 background(255);
 waterRenderer.execute(); 
 camera.arrange();
 
 //---Tests---
 if (keyPressed)
   testMoveAroundFreelyWithArrowKeys(keyCode); 
}
