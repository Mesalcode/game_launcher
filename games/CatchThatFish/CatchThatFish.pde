WaterRenderer waterRenderer;
Camera camera;
ArrayList<FishSettings> fishSettings;
ArrayList<Renderer> renderers;
ArrayList<Fish> fishs;
int[] gWaterColor;
float gSizeMultiplicator;

void setup(){
 frameRate(60);
 fullScreen(P3D);
 initializeGlobalVariables();
 initializeRenderers();
 camera = new Camera(displayWidth/2,displayHeight/2);
}
void initializeGlobalVariables(){
 //gWaterColor = new int[]{0,0,125,40};
 gWaterColor = new int[]{#74C4FF};
 gSizeMultiplicator = 0.35;
 renderers = new ArrayList<Renderer>();
 fishs = new ArrayList<Fish>();
 fishSettings = loadFishSettings();
}
void initializeRenderers(){
 renderers.add(new WaterRenderer(0,600,20000,5000,gWaterColor)); 
 for (FishSettings f : fishSettings){
   fishs.add(new Fish(f));
 }
 for (Fish f : fishs){
   renderers.add(new FishRenderer(f));
 }
}
void draw(){
 background(255);
 for (Renderer r : renderers){
  r.execute(); 
 }
 for (Fish f : fishs)
   f.move();
 camera.arrange();
 
 //---Tests---
 if (keyPressed)
   testMoveAroundFreelyWithArrowKeys(keyCode); 
}
ArrayList<FishSettings> loadFishSettings(){
  
  String[] abilities = loadStrings("META/ABILITIES.meta");
  for (int i = 0; i < abilities.length;i++)
    abilities[i] = abilities[i].substring(abilities[i].indexOf(",")+1);
  String[] lexicons = loadStrings("META/LEXICON.meta");
  for (int i = 0; i < lexicons.length;i++)
    lexicons[i] = lexicons[i].substring(lexicons[i].indexOf(",")+1);
  String[] renderData = loadStrings("META/RENDER.meta");
  for (int i = 0; i < renderData.length;i++)
    renderData[i] = renderData[i].substring(renderData[i].indexOf(",")+1);
  ArrayList<FishSettings> setts = new ArrayList<FishSettings>();
  for (int i = 0; i < abilities.length;i++){
     String[] lSplit = lexicons[i].split(",");
     String[] abilitiesSplit = abilities[i].split(",");
     setts.add(new FishSettings(loadImage(renderData[i]),new LexiconArticle(lSplit[0],lSplit[1],lSplit[2]),new AbilityData(Double.parseDouble(abilitiesSplit[0]),Double.parseDouble(abilitiesSplit[1]),Double.parseDouble(abilitiesSplit[2]))));
  }
  return setts;
}
