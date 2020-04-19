/*
MIT License

Copyright (c) 2020 Alexander Mertens

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
Camera camera;
MesalAPI api;
ArrayList<FishSettings> fishSettings;
ArrayList<Renderer> renderers;
ArrayList<Fish> fishs;
ArrayList<Duck> ducks;
Player player;
int gWorldBorderX,gWorldBorderY,gLandScapeEndY,gTargetReachedRange,gDuckCount,gMaxTargetDistanceInDisplayRelativeSize,gBoatOffset,gDuckOffset;
float gSizeMultiplicator,gBoatSizeMultiplicator;
PImage backgroundImage;
PImage duckImage;
PImage playerImage;
void setup(){
 frameRate(60);
 fullScreen(P3D);
 initializeGlobalVariables();
 initializeEntetiesAndRenderers();
 camera = new Camera(new MesalAPI().new Position(displayWidth/2,displayHeight/2));
}
private void initializeGlobalVariables(){
 gSizeMultiplicator = 0.15;
 renderers = new ArrayList<Renderer>();
 fishs = new ArrayList<Fish>();
 ducks = new ArrayList<Duck>();
 fishSettings = loadFishSettings();
 backgroundImage = loadImage("background.png");
 duckImage = loadImage("babyduck.png");
 playerImage = loadImage("player.png");
 gBoatSizeMultiplicator = 0.7;
 playerImage.resize((int)(playerImage.width*gBoatSizeMultiplicator),(int)(playerImage.height*gBoatSizeMultiplicator));
 gWorldBorderX = backgroundImage.width;
 gWorldBorderY = backgroundImage.height;
 gLandScapeEndY = 450;
 gTargetReachedRange = 50;
 gBoatOffset = -104;
 gDuckOffset = 20;
 gDuckCount = 9;
 gMaxTargetDistanceInDisplayRelativeSize = 2;
 api = new MesalAPI();
}
private void initializeEntetiesAndRenderers(){
 
 renderers.add(new WaterRenderer(0,600,20000,5000,backgroundImage)); 
 for (FishSettings f : fishSettings){
   for (int i = 0; i < 8.314299*Math.pow(f.abilityData.size,-0.9812073);i++){
   Fish toAdd = new Fish(f);
   fishs.add(toAdd);
   renderers.add(new FishRenderer(toAdd));
   }
 }
 player = new Player();
 renderers.add(new PlayerRenderer(player));
  for (int i = 0; i < gDuckCount;i++){
    Duck toAdd = new Duck();
    ducks.add(toAdd);
    renderers.add(new DuckRenderer(toAdd));
 }
}
void draw(){
 background(255);
 for (Renderer r : renderers)
  r.execute(); 
 for (Fish f : fishs)
   f.act();
 for (Duck d : ducks)
   d.act();
 camera.arrange();
 
 //---Tests---
 player.lowerString();
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
     settings.add(new FishSettings(loadImage(renderData[i]),new LexiconArticle(lexiconSplit[0],lexiconSplit[1],lexiconSplit[2]),new AbilityData(Double.parseDouble(abilitiesSplit[0]),Double.parseDouble(abilitiesSplit[2]),Double.parseDouble(abilitiesSplit[1]),Double.parseDouble(abilitiesSplit[3]),Double.parseDouble(abilitiesSplit[4]),Double.parseDouble(abilitiesSplit[5]))));
     
  }
  return settings;
}
