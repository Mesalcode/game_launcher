class GameObjectThread extends Thread{
  Call toExecute = null;
  void setCall(Call toExecute){
    this.toExecute = toExecute;
  }
  @Override
  void run(){
    try{
     toExecute.exec(); 
    }catch(NullPointerException npe){
      println("WARNING! Thread "+ getId() +" has no call to execute.\nThis could strongly affect the performance while runtime, when occuring in mass");
    }catch (Exception e){
     println("WARNING! Thread " + getId() + " threw unknown exception.\nThis could strongly affect the performance while runtime, when occuring in mass");  
    }
  }
}
