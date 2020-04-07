void testMoveAroundFreelyWithArrowKeys(int keyCodeInput){
 switch (keyCodeInput){
   case LEFT:
     camera.move(-10,0);
     break;
   case RIGHT:
     camera.move(10,0);
     break;
   case DOWN:
     camera.move(0,10);
     break;
   case UP:
     camera.move(0,-10);
     break;
 }
}
