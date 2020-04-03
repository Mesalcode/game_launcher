interface Upgrade{
 void exec();
}
class BirdSummoner implements Upgrade{
 @Override
 void exec(){
   birds.add(new Bird(1,2, birdLeft, birdRight,0,200));
 }
}
class BirdSummonerB implements Upgrade{
 @Override
 void exec(){
   birds.add(new Bird(400,5, birdLeftB, birdRightB,200,400));
 }
}
class BirdSummonerC implements Upgrade{
 @Override
 void exec(){
   birds.add(new Bird(100,8, birdLeftC, birdRightC,400,1000));
 }
}
