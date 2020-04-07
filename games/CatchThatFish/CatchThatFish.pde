WaterRenderer waterRenderer;
int[] gWaterColor;

void setup(){
 frameRate(30);
 fullScreen();
 initializeGlobalVariables();
 initializeRenderers();
}
void initializeGlobalVariables(){
 gWaterColor = new int[]{0,0,125,125};
}
void initializeRenderers(){
 waterRenderer = new WaterRenderer(0,200,2000,5000,gWaterColor); 
}
void draw(){
 waterRenderer.execute(); 
}
