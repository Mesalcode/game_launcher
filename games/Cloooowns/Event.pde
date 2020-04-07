
class Event implements Cloneable{
  String title;
  int duration;
  int existedFor = 0;
  boolean good;
  int[] ccolor;
  Event(String title, int duration, boolean good, int[] ccolor){
    this.title = title;
    this.duration = duration;
    this.good = good;
    this.ccolor = ccolor;
  }
  @Override
   public Object clone() throws CloneNotSupportedException {
     return (Event)super.clone();
   }
 void showMessage(){
   
 }
 void begin(){
   existedFor++;
   textAlign(CENTER,CENTER);
   textSize(100);
   filter(GRAY);
   filter(BLUR);
   fill(ccolor[0],ccolor[1],ccolor[2]);
   text(title,displayWidth/2,displayHeight/2);
   textAlign(LEFT);
 
 
 }
 void act(){
 existedFor++;
 textAlign(CENTER,CENTER);
 textSize(80);
 fill(ccolor[0],ccolor[1],ccolor[2]);
 text(title.split("\\(")[0] + ": " + String.valueOf((duration-existedFor)/30)+"s",displayWidth/2,displayHeight/15);
 textAlign(LEFT);
 }
 void end(){}
}
int[] dccol = {255,215,0};
class DoubleCash extends Event{

  DoubleCash(int duration){
    super("Doppeltes Geld ("+duration/30+"s)",duration,true,dccol);
  }
  @Override
  void begin(){
   super.begin();
   cashMultiplicator = 2;
   music.stop();
  }
  @Override
  void act(){
   super.act();
   if (!music.isPlaying())
     music.loop(1,musicVolume);
  }
  
  @Override
  void end(){
    super.end();
    cashMultiplicator = 1;
  }
}
int[] gacol = {255,255,255};
class GhostAttack extends Event{
  int delay = ((int)random(5)+1)*30;
  int d = 1;
  GhostAttack(int duration){
    super("Geisterangriff ("+duration/30+"s)",duration,true,gacol);
  }
  @Override
  void begin(){
   super.begin();
   music.stop();
  }
  @Override
  void act(){
   super.act();
   if (!music.isPlaying())
     music.loop(1,musicVolume);
   if(d<delay)
     d++;
   else{
    d=1;
    if (!allChased())
    ghosts.add(new Ghost(findTarget()));
   }
  }
  
  @Override
  void end(){
    super.end();
  }
}
int[] wacol = {144, 66, 245};
class WolfAttack extends Event{
  int delay = ((int)random(5)+1)*30;
  int d = 1;
  WolfAttack(int duration){
    super("Wolfsrudel ("+duration/30+"s)",duration,true,wacol);
  }
  @Override
  void begin(){
   super.begin();
   music.stop();
  }
  @Override
  void act(){
   super.act();
   if (!music.isPlaying())
     music.loop(1,musicVolume);
   if(d<delay)
     d++;
   else{
    d=1;
    if (!allChased())
    wolfs.add(new Wolf(findTarget()));
   }
  }
  
  @Override
  void end(){
    super.end();
  }
}
int[] hscol = {245, 144, 66};
class HighSpeed extends Event{
  HighSpeed(int duration){

    super("Hochgeschwindigkeit ("+duration*8/240+"s)",duration*8,true,hscol);
  }
  @Override
  void act(){
   existedFor++;
   textAlign(CENTER,CENTER);
   textSize(80);
   fill(ccolor[0],ccolor[1],ccolor[2]);
   text(title.split("\\(")[0] + ": " + String.valueOf((duration-existedFor)/240)+"s",displayWidth/2,displayHeight/15);
   textAlign(LEFT);
   if (frameRate<=30)
     frameRate(240);
   
  }
  @Override
  void end(){
    frameRate(30);
    
  }
  
  
}
int[] cacol = {245, 66, 66};
class ClownAlarm extends Event{
  int delay = ((int)random(7)+1)*30;
  int d = 1;
  ClownAlarm(int duration){
    super("Clooowns! ("+duration/30+"s)",duration,true,cacol);
  }
  @Override
  void begin(){
   super.begin();
   music.stop();
  }
  @Override
  void act(){
   super.act();
   if (!music.isPlaying())
     music.loop(1,musicVolume);
   if(d<delay)
     d++;
   else{
    d=1;
    spawnClown();
   }
  }
  
  @Override
  void end(){
    super.end();
  }
}
class BlackholePanic extends Event{
  boolean acted = false;
  BlackholePanic(){
    super("Schwarzes Loch ("+10+"s)",10*30,true,cacol);
  }
  @Override
  void begin(){
   super.begin();
   music.stop();
   if (!acted)
    blackHole.exec();
   acted = true;
  }
  @Override
  void act(){
   super.act();
   if (!music.isPlaying())
     music.loop(1,musicVolume);
   
  }
  
  @Override
  void end(){
    super.end();
  }
  }
class MouseAttack extends Event{
  int delay = (int)(random(10)+5)*30;
  int d = 0;
  MouseAttack(int duration){
    super("Mausangriff ("+duration/30+"s)",duration,true,cacol);
  }
  @Override
  void act(){
  super.act();
  if (d<delay)
    d++;
  else {
    d=0;
    if (!allChasedC()){
      //wolfs.add(new Wolf(findTarget()));
      try{
      mice.add(new Mouse(findTargetC()));
      }catch(Exception e){}
    } 
  }
  }
}
int[] cscol = {0,255,0};
class ClownSwap extends Event{
  boolean inited = false;
  ClownSwap(int duration){
   super("Clowntausch ("+duration/30+"s)",duration,true,cscol);
  
  }
  @Override
  void act(){
   super.act(); 
   ArrayList<Clown> cc = (ArrayList<Clown>)clowns.clone();
   for (Clown c : cc){
     if (!c.swapped)
       c.swap();
   }
    
  }
  @Override
  void end(){
   super.end();
   ArrayList<Clown> cc = (ArrayList<Clown>)clowns.clone();
   for (Clown c : cc){
     c.unswap();
   } 
    
  }
  
}
  
  
  
  
