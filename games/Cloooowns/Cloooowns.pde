import java.util.Random;
import ddf.minim.*;
Minim minim;
ddf.minim.AudioSample popSound;
ddf.minim.AudioSample windSound;
ddf.minim.AudioSample blackHoleSound;
ddf.minim.AudioSample magicSound;
ddf.minim.AudioSample cashSound;
import processing.sound.*;
PImage bg;
PImage blackHoleImage;
PImage clownImage;
PImage weakclownImage;
PImage strongclownImage;
PImage bossclownImage;
PImage wolfImage;
PImage ghostImage;
PImage weakclownFrightened;
PImage strongclownFrightened;
PImage bossclownFrightened;
PImage clownFrightened;
PImage torchImage;
PImage birdLeft;
PImage birdRight;
PImage birdLeftB;
PImage birdRightB;
PImage birdLeftC;
PImage birdRightC;
PImage coinImage;
PImage scissorsImage;
PImage flameImage;
PImage girlImage;
PImage girlFrightened;
PImage heartImage;
PImage tornadoImage;
PImage catLeftImage;
PImage catRightImage;
PImage mouseImage;
PImage shopBlackHole;
PImage shopGhost;
PImage shopGhosts;
PImage shopBirdA;
PImage shopBirdB;
PImage shopBirdC;
float bloonSpeed = -0.01;
ArrayList<Clown> clowns;
ArrayList<Balloon> bloons;
ArrayList<Wolf> wolfs;
ArrayList<Ghost> ghosts;
ArrayList<Bird> birds;
ArrayList<Cat> cats;
ArrayList<Mouse> mice;
Event[] events;
Event currentEvent;
SoundFile music;
Ability magic;
Ability wind;
Ability blackHole;
Ability wolfChase;
Ability ghostKidnapping;
boolean shopMode = false;
Upgrade summonBird;
Upgrade summonBirdB;
Upgrade summonBirdC;
int clownSpawnDelay;
int csdc = 0;
int points = 0;
int coins = 0;
int lives = 50;
int cashMultiplicator = 1;
float musicVolume = 0.5;
Cursor activeCursor;
boolean blackHoleActive = false;
int abilityAnimationLength = 0;
int abilityAnimationPosition = 0;
void setup(){
 frameRate(30);
 fullScreen(); 
 minim = new Minim(this);
 textFont(createFont("pixelart.ttf",32));
 torchImage = loadImage("torch.png");
 bg = loadImage("bg.png");
 shopGhost = loadImage("shop_ghost.png");
 shopGhosts = loadImage("shop_ghosts.png");
 popSound = minim.loadSample("pop.mp3");
 windSound = minim.loadSample("wind.mp3"); 
 magicSound =  minim.loadSample("magic.mp3");
 cashSound = minim.loadSample("cash.mp3");
 blackHoleImage = loadImage("blackhole.png");
 wolfImage = loadImage("wolf.png");
 ghostImage = loadImage("ghost.png");
 clownFrightened = loadImage("clown_frightened.png");
 weakclownFrightened = loadImage("weakclown_frightened.png");
 birdLeft = loadImage("bird_left.png");
 birdRight = loadImage("bird_right.png");
 birdLeftB = loadImage("bird_leftb.png");
 birdRightB = loadImage("bird_rightb.png");
 birdLeftC = loadImage("bird_leftc.png");
 shopBirdA = loadImage("shop_bluebird.png");
 shopBirdB = loadImage("shop_redbird.png");
 shopBirdC = loadImage("shop_eagle.png");
 birdRightC = loadImage("bird_rightc.png");
 shopBlackHole = loadImage("shop_blackhole.png");
 coinImage = loadImage("coin.png");
 girlFrightened = loadImage("girl_frightened.png");
 scissorsImage = loadImage("scissors.png");
 flameImage = loadImage("fire.png");
 clownImage = loadImage("clown.png");
 weakclownImage = loadImage("weakclown.png");
 strongclownImage = loadImage("strongclown.png");
 bossclownImage = loadImage("bossclown.png");
 mouseImage = loadImage("mouse.png");
 bossclownFrightened = loadImage("bossclown_frightened.png");
 blackHoleSound =  minim.loadSample("blackhole.mp3");
 strongclownFrightened = loadImage("strongclown_frightened.png");
 heartImage = loadImage("heart.png");
 girlImage = loadImage("girl.png");
 catLeftImage = loadImage("cat_left.png");
 catRightImage = loadImage("cat_right.png");
 tornadoImage = loadImage("tornado.png");
 bg.resize(displayWidth,displayHeight);
 clowns = new ArrayList<Clown>();
 bloons = new ArrayList<Balloon>();
 music = new SoundFile(this,"music.mp3");
 music.loop(1,musicVolume);
 wolfs = new ArrayList<Wolf>();
 ghosts = new ArrayList<Ghost>();
 birds = new ArrayList<Bird>();
 cats = new ArrayList<Cat>();
 mice = new ArrayList<Mouse>();
 clownSpawnDelay = (int)(frameRate*5);
 magic = new Magic();
 wind = new Wind();
 blackHole  = new Blackhole();
 wolfChase = new WolfChase();
 ghostKidnapping = new GhostKidnapping();
 activeCursor = new CursorTornado();
 activeCursor.init();
 summonBird = new BirdSummoner();
 summonBirdB = new BirdSummonerB();
 summonBirdC = new BirdSummonerC();
 Event[] evsec = {
 new DoubleCash(30*30),new DoubleCash(30*60),
 new DoubleCash(30*120),new GhostAttack(30*20),
 new GhostAttack(30*10),new WolfAttack(30*30),
 new WolfAttack(30*20),new WolfAttack(30*10),
 new HighSpeed(30*30),new HighSpeed(30*20),
 new ClownAlarm(30*30),new ClownAlarm(60*30),
 new ClownAlarm(75*30), new BlackholePanic(),
 new BlackholePanic(),new MouseAttack(30*30),
 new MouseAttack(30*30),new ClownSwap(30*30)
 };

 events = evsec;
 currentEvent = null;
 clowns.add(new WeakClown(weakclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
}
void draw(){
 if (!shopMode){
 if (!blackHoleActive){
 image(bg,0,0); 
 ArrayList<Ghost> clonedGhosts = (ArrayList<Ghost>)ghosts.clone();
 for (Ghost g : clonedGhosts){
   g.chase();
   g.animate();
 }
 ArrayList<Clown> cc = (ArrayList<Clown>)clowns.clone();
 for (Clown c : cc){
   c.animate();
   c.act();
 }
 ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
 for (Balloon b : cloned){
   b.animate();
   b.move();
 }
 
 if (csdc<clownSpawnDelay)
   csdc++;
  else{
    spawnClown();
    csdc = 0; 
    if (random(100)<=40)
      startEvent();
  }
 }else {
   image(bg,0,0); 
   ArrayList<Ghost> clonedGhosts = (ArrayList<Ghost>)ghosts.clone();
   for (Ghost g : clonedGhosts){
     g.chase();
     g.animate();
   }
   if (abilityAnimationPosition<=abilityAnimationLength/2){
   imageMode(CENTER);
   image(blackHoleImage,displayWidth/2,displayHeight/2);
   imageMode(CORNER);
   ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
   for (Balloon b : cloned){
     b.toCenter();
     b.animate();
   }
   
   }else if (abilityAnimationPosition>=abilityAnimationLength-abilityAnimationLength/9){
     imageMode(CENTER);
   image(blackHoleImage,displayWidth/2,displayHeight/2);
   imageMode(CORNER);
   ArrayList<Balloon> cloned = (ArrayList<Balloon>)bloons.clone();
   for (Balloon b : cloned){
     b.animate();
   }
   
     
   }
   if (abilityAnimationPosition<abilityAnimationLength){
    abilityAnimationPosition++; 
   }else {
    abilityAnimationLength = 0;
    abilityAnimationPosition = 0;
    blackHoleActive = false;
   }
   ArrayList<Clown> clonedClowns = (ArrayList<Clown>)clowns.clone();
   for (Clown c : clonedClowns){
     c.animate();
   }
 }
 ArrayList<Wolf> clonedWolfs = (ArrayList<Wolf>)wolfs.clone();
 for (Wolf w : clonedWolfs){
   w.chase();
   w.animate();
 }
 ArrayList<Bird> clonedBirds = (ArrayList<Bird>)birds.clone();
 for (Bird b : clonedBirds){
   b.animate();
   b.search();
 }
 ArrayList<Cat> clonedCats = (ArrayList<Cat>)cats.clone();
 for (Cat c : clonedCats){
   c.animate();
   c.chase();
 }
 ArrayList<Mouse> clonedMice = (ArrayList<Mouse>)mice.clone();
 for (Mouse m : clonedMice){
   m.animate();
   m.chase();
 }
 textSize(displayWidth/40);
 fill(255);
 if (lives<=0){
  noLoop();
  background(0);
  text("ENDE",displayWidth/2,displayHeight/2);
   
 }
 image(heartImage,displayWidth/20,displayHeight/12-displayHeight/30);
 text("    " + lives,displayWidth/20,displayHeight/12);
 text("Punkte: " + points,displayWidth-displayWidth/5,displayHeight/12);
 image(coinImage,displayWidth-displayWidth/5,displayHeight/9.25);
 text("   "+coins,displayWidth-displayWidth/5,displayHeight/7);
 activeCursor.act(mouseX,mouseY);
 if (currentEvent!=null){
  if (currentEvent.existedFor<30)
    currentEvent.begin();
  else if (currentEvent.existedFor<currentEvent.duration)
    currentEvent.act();
  else{
    currentEvent.end();
    currentEvent = null; 
  }
 }
 }else {
   shop();
   
 }
}

void mouseMoved(){
  activeCursor.act(mouseX,mouseY);
}
void keyPressed(){
 if (key=='m')
   magic.exec();
 if (key=='w')
   wind.exec();
 if (keyCode==TAB)
   shopMode = !shopMode;
 if (key=='h')
   wolfChase.exec();
 if (key=='g')
   ghostKidnapping.exec();
 if(key=='ä'){
   startEvent();
 }
 if (key=='k')
   cats.add(new Cat());
  
  if (key=='+')
    summonBird.exec();
   if (key=='-')
    summonBirdB.exec(); 
   if (key=='#')
    summonBirdC.exec(); 
   if (key=='c')
     spawnClown();
   
}
void startEvent(){
  Event e = events[(int)random(events.length-1)];
  try {
  currentEvent = currentEvent==null ? (Event)e.clone() : currentEvent;
  }catch (CloneNotSupportedException cnse){
    
  }
  
}
void spawnClown(){
  if (random(100)<=90){
  if (points<300)
    clowns.add(new WeakClown(weakclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
  else if (points<1000){
   if (random(100)>=70)
     clowns.add(new WeakClown(weakclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
   else
     clowns.add(new Clown(clownImage,clownFrightened,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
  }else if (points<5000){
    if (random(100)<=10)
     clowns.add(new WeakClown(weakclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
    else if (random(100)<=70)
      clowns.add(new Clown(clownImage,clownFrightened,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
    else
      clowns.add(new StrongClown(strongclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
  }else{
    if (random(100)<=10)
     clowns.add(new WeakClown(weakclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
    else if (random(100)<=70)
      clowns.add(new Clown(clownImage,clownFrightened,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
    else if (random(100)<=65)
      clowns.add(new StrongClown(strongclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
    else
      clowns.add(new BossClown(bossclownImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
  }
  }else {
    clowns.add(new Girl(girlImage,(int)(random(displayWidth/2)+displayWidth/4),displayHeight-displayHeight/3-displayHeight/8,(int)frameRate));
  }
    
}
