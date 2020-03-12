import java.lang.Thread;
import javax.swing.*;
Ball ball = new Ball(300,300,-2,1,30);
Pong pong1;
Pong pong2;
boolean win1,win2;
int winDelay = 120;
int wc = 0;
boolean inGame = false;
String name = "Spieler";
int score1,score2;
int[] green = {0,125,0};
int[] red = {125,0,0};
int diffic = 0;
void setup(){
 size(600,800); 
 init();
}
void draw(){
  
  if (inGame){
 
 background(0);
 strokeWeight(7);
 line(0,0,600,0);
 strokeWeight(10);
 stroke(green[0],green[1],green[2]);
 line(1,0,1,610);
 stroke(red[0],red[1],red[2]);
 line(599,0,599,610);
 stroke(255);
 strokeWeight(1);
 textSize(50);
 fill(green[0],green[1],green[2]);
 text(score1,200,700);
 fill(red[0],red[1],red[2]);
 text(score2,400,700);
 fill(255);
 text(pong1.getName(),100,760);
 text(pong2.getName(),400,760);
 stroke(255);
 strokeWeight(10);
 line(0,610,600,610);
 stroke(255);
 strokeWeight(1);


 ball.animate();
 
 pong1.animate();
 pong2.animate();
 pong2.handleKeys(keyCode);
  }else {
     background(0);
     imageMode(CENTER);
     image(loadImage("button_0.png"),300,100);
     image(loadImage("button_1.png"),300,400);
     image(loadImage("button_2.png"),300,700);
  }
 
}
void init(){
 pong1 = new Pong(30,300,15,90,87,83, 7 , false , name , green);
 pong2 = new Pong(570,300,15,90,UP,DOWN, diffic, true , "Roboter" , red); 
 score1 = 0;
 score2 = 0;
 win1 = false;
 win2 = false;
}

void keyPressed(){
  if (inGame)
     pong1.handleKeys(keyCode); 
 
}
void score(int add0,int add1){
  
 
  score1+=add1;
  score2+=add0;
  ball.respawn();
  pong1.reset();
  pong2.reset();
  frameRate(frameRate-220);
}
void mousePressed(){
 
 if (!inGame){
   if (mouseX>200&&mouseX<400&&mouseY>50&&mouseY<150){
     diffic = 2;
     init();
     inGame = true;
   }else if (mouseX>200&&mouseX<400&&mouseY>350&&mouseY<450){
     diffic = 3;
     init();
     inGame = true;
     
   }else if (mouseX>200&&mouseX<400&&mouseY>650&&mouseY<750){
     diffic = 5;
     init();
     inGame = true;
     
   }
   
 }
  
}
