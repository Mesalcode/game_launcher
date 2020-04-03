class Balloon {
  float  windStrength, speedY;
  int posX, posY;
  int[] colors;
  int rad;
  int poin;
  boolean popped = false;
  boolean chased = false;
  public int liv;
  int damage;
  float cwindStrength = 0f;
  Balloon(int startX, int startY, float speedY, int[] colors, int lives, int points, int damage) {
    posX = startX;
    posY = startY;
    this.speedY = speedY;
    this.colors = colors;
    poin = points;
    rad = 40 + (int)(lives * 0.1);
    liv = lives;
    this.damage = damage;
  }
  void chase(){
   chased = true; 
  }
  void animate() {
    if (rad>=40){
    fill(colors[0], colors[1], colors[2],colors[3]);
    circle(posX, posY, rad);
    fill(0);
    stroke(0);
    line(posX, posY+rad/2, posX, posY+rad*3-rad/2);
    }else {
      bloons.remove(this); 
      popSound.trigger();
      points+=poin;
      coins+=random(3)*poin*cashMultiplicator;
      popped = true;
    }
  }
  void move(){
   posY+=speedY;
   if (posY<10){
     pop(liv);
     lives-=damage; 
   }
  }
  void nearer(int mX,int mY){
    if (mX>posX){
      posX++;
    }else {
      posX--;
    }
    if (mY>posY){
      posY++;
    }else {
      posY--;
    }
  }
  void pop(int by){
    if (liv<=0){
      bloons.remove(this); 
      popSound.trigger();
      points+=poin;
      coins+=random(3)*poin*cashMultiplicator;
      popped = true;
    }
    else{
      liv-=by;
      rad = 40+ (int)(liv * 0.1);
      
    }
    
  }
  void sink(float by){
   posY+=by; 
  }
  void changeBoost(float by){
   speedY+=by; 
  }
  void toCenter(){
   if (dist(posX,posY,displayWidth/2,displayHeight/2)>40){
     if (posX<displayWidth/2){
       posX+=10;
     }else {
      posX-=10; 
     }
     if (posY<displayHeight/2){
        posY+=10;
     }else {
        posY-=10; 
     }
   }else {
    posX+=random(40)-20;
    posY+=random(40)-20;
   }
  }
  int getX(){
   return posX; 
    
  }
   int getY(){
   return posY; 
    
  }
}
class CashBalloon extends Balloon{
  CashBalloon(int startX, int startY, float speedY, int[] colors, int lives, int points,int damage){
    super(startX,startY,speedY,colors,lives,points,damage);
  }
  @Override
  void animate(){
   super.animate();
   fill(125);
   text("$",posX-12,posY+12);
   fill(0);
  }
  @Override
   void pop(int by){
      bloons.remove(this); 
      cashSound.trigger();
      coins+=poin*cashMultiplicator;
      popped = true;
    }
}
