WaterRenderer waterRenderer;
int[] gWaterColor;

void setup(){
 frameRate(30);
 fullScreen(P3D);
 initializeGlobalVariables();
 initializeRenderers();
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
}
