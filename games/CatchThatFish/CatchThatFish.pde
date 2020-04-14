WaterRenderer waterRenderer;
Camera camera;
ArrayList<FishSettings> fishSettings;
ArrayList<Renderer> renderers;
ArrayList<Fish> fishs;
int gWorldBorderX,gWorldBorderY;
float gSizeMultiplicator;
PImage backgroundImage;
void setup(){
 frameRate(60);
 fullScreen(P3D);
 initializeGlobalVariables();
 initializeRenderers();
 camera = new Camera(new Position(displayWidth/2,displayHeight/2));
}
private void initializeGlobalVariables(){
 gSizeMultiplicator = 0.15;
 renderers = new ArrayList<Renderer>();
 fishs = new ArrayList<Fish>();
 fishSettings = loadFishSettings();
 backgroundImage = loadImage("background.png");
 gWorldBorderX = backgroundImage.width;
 gWorldBorderY = backgroundImage.height;
}
private void initializeRenderers(){
 renderers.add(new WaterRenderer(0,600,20000,5000,backgroundImage)); 
 for (FishSettings f : fishSettings){
   Fish toAdd = new Fish(f);
   fishs.add(toAdd);
   renderers.add(new FishRenderer(toAdd));
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
private String[] loadMetaData(String metaName){
  String[] metaData = loadStrings("META/"+metaName+".meta");
  for (int i = 0; i < metaData.length;i++)
    metaData[i] = metaData[i].substring(metaData[i].indexOf(",")+1);
  return metaData;
}
private ArrayList<FishSettings> loadFishSettings(){
  String[] abilities = loadMetaData("ABILITIES");
  String[] lexicons = loadMetaData("LEXICON");
  String[] renderData = loadMetaData("RENDER");
  ArrayList<FishSettings> settings = new ArrayList<FishSettings>();
  for (int i = 0; i < abilities.length;i++){
     String[] lexiconSplit = lexicons[i].split(",");
     String[] abilitiesSplit = abilities[i].split(",");
     settings.add(new FishSettings(loadImage(renderData[i]),new LexiconArticle(lexiconSplit[0],lexiconSplit[1],lexiconSplit[2]),new AbilityData(Double.parseDouble(abilitiesSplit[0]),Double.parseDouble(abilitiesSplit[2]),Double.parseDouble(abilitiesSplit[1]))));
  }
  return settings;
}
