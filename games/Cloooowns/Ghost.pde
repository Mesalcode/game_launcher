class Ghost{
  int posX,posY;
  Clown tar;
  Ghost(Clown target){
   target.scare(); 
   posX = target.girl ? target.x-85 : target.x;
   target.chase = true;
   tar = target;
  }
  void elevate(){
   posY-=4;
   tar.elevate();
   if (posY<-70){
    ghosts.remove(this);
    clowns.remove(tar);
   }
  }
  void chase(){
    if (tar.y>posY-35){
       posY+=4; 
    }else {
     elevate(); 
    }
  }
  void animate(){
   image(ghostImage,posX,posY);
  }
  
  
  
  
  
}
