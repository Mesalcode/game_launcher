Player pacman = new Player(408,425,40,40);
Wall[] walls = new Wall[40];
Coin[] coins = new Coin[182];
Enemy[] enemies = new Enemy[4];
int points = 0;
boolean inGame = true;
int playerStepSize = 2;
PImage coinImage;
PImage mapImage;
void setup(){
 size(816,1000); 
 coinImage = loadImage("coin_small.jpg");
 mapImage = loadImage("map_blank.jpg");
 surface.setTitle("PacMan Remake von Alexander Mertens");
 
 walls[0] = new Wall(0,0,15,800);
 walls[1] = new Wall(0,0,812,15);
 walls[2] = new Wall(799,0,812,800);
 walls[3] = new Wall(0,785,812,785);
 walls[4] = new Wall(0,245,163,105);
 walls[5] = new Wall(0,245+155,163,105);
 walls[6] = new Wall(816,245,-163,105);
 walls[7] = new Wall(816,245+155,-163,105);
 walls[8] = new Wall(212,168,38,180);
 walls[9] = new Wall(212+353,168,38,180);
 walls[10] = new Wall(212,168+232,38,103);
 walls[11] = new Wall(212+353,168+232,38,103);
 walls[12] = new Wall(212,168+463,38,103);
 walls[13] = new Wall(212+353,168+463,38,103);
 walls[14] = new Wall(211+178,168+463,38,103);
 walls[15] = new Wall(211-86,168+387,38,103);
 walls[16] = new Wall(211+443,168+387,38,103);
 walls[17] = new Wall(211+179,168+310,38,103);
 walls[18] = new Wall(211+179,169,38,103);
 walls[19] = new Wall(211+179,15,38,103);
 walls[20] = new Wall(126+179,327,205,96);
 walls[21] = new Wall(66,66,97,51);
 walls[22] = new Wall(213,66,125,51);
 walls[23] = new Wall(479,66,125,51);
 walls[24] = new Wall(654,66,97,51);
 walls[25] = new Wall(66,168,97,26);
 walls[26] = new Wall(654,168,97,26);
 walls[27] = new Wall(301,168,214,26);
 walls[28] = new Wall(245,246,94,25);
 walls[29] = new Wall(477,246,94,25);
 walls[30] = new Wall(300,478,215,25);
 walls[31] = new Wall(213,555,125,25);
 walls[32] = new Wall(478,555,125,25);
 walls[33] = new Wall(66,555,75,25);
 walls[34] = new Wall(654,555,95,25);
 walls[35] = new Wall(0,632,75,25);
 walls[36] = new Wall(742,632,75,25);
 walls[37] = new Wall(300,632,214,25);
 walls[38] = new Wall(65,709,272,25);
 walls[39] = new Wall(478,709,272,28);
 coins[0] = new Coin(40,40);
 coins[1] = new Coin(40*2,40);
 coins[2] = new Coin(40*3,40);
 coins[3] = new Coin(40*4,40);
 coins[4] = new Coin(40*5,40);
 coins[5] = new Coin(40*6,40);
 coins[6] = new Coin(40*7,40);
 coins[7] = new Coin(40*8,40);
 coins[8] = new Coin(40*9,40);
 coins[9] = new Coin(612-40*4,40);
 coins[10] = new Coin(612-40*3,40);
 coins[11] = new Coin(612-40*2,40);
 coins[12] = new Coin(612-40*1,40);
 coins[13] = new Coin(612,40);
 coins[14] = new Coin(612+40,40);
 coins[15] = new Coin(612+40*2,40);
 coins[16] = new Coin(612+40*3,40);
 coins[23] = new Coin(800-30,40);
 coins[17] = new Coin(185,90);
 coins[18] = new Coin(612-250,90);
 coins[19] = new Coin(612-160,90);
 coins[20] = new Coin(612+10,90);
 coins[21] = new Coin(612+40*4,90);
 coins[22] = new Coin(40,90);
 coins[23] = new Coin(40,140);
 coins[24] = new Coin(40*2,140);
 coins[25] = new Coin(40*3,140);
 coins[26] = new Coin(40*4,140);
 coins[27] = new Coin(40*5,140);
 coins[28] = new Coin(40*6,140);
 coins[29] = new Coin(40*7,140);
 coins[30] = new Coin(40*8,140);
 coins[31] = new Coin(40*9,140);
 coins[32] = new Coin(612-40*4,140);
 coins[33] = new Coin(612-40*3,140);
 coins[34] = new Coin(612-40*2,140);
 coins[35] = new Coin(612-40*1,140);
 coins[36] = new Coin(612,140);
 coins[37] = new Coin(612+40,140);
 coins[38] = new Coin(612+40*2,140);
 coins[39] = new Coin(612+40*3,140);
 coins[40] = new Coin(800-30,140);
 coins[41] = new Coin(405,140);
 coins[42] = new Coin(812-40,40);
 coins[43] = new Coin(185,180);
 coins[44] = new Coin(40,180);
 coins[45] = new Coin(812-40,180);
 coins[46] = new Coin(625,180);
 coins[47] = new Coin(40+235,180);
 coins[48] = new Coin(625-90,180);
 coins[49] = new Coin(625-90,220);
 coins[50] = new Coin(625-90,220);
 coins[51] = new Coin(625-90,220);
 coins[52] = new Coin(625-90,220);
 coins[53] = new Coin(40,220);
 coins[54] = new Coin(40*2+10,220);
 coins[55] = new Coin(40*3+15,220);
 coins[56] = new Coin(40*4+25,220);
 coins[57] = new Coin(812-40,220);
 coins[58] = new Coin(812-40*2-10,220);
 coins[59] = new Coin(812-40*3-15,220);
 coins[60] = new Coin(275,220);
 coins[61] = new Coin(315,220);
 coins[62] = new Coin(360,220);
 coins[63] = new Coin(625,220);
 coins[63] = new Coin(450,220);
 coins[64] = new Coin(495,220);
 coins[65] = new Coin(40*4+25,260);
 coins[66] = new Coin(40*8+40,260);
 coins[67] = new Coin(40*8+130,260);
 coins[68] = new Coin(40*15+25,260);
 coins[69] = new Coin(40*15+25,220);
 coins[70] = new Coin(185,300);
 coins[71] = new Coin(275,300);
 coins[72] = new Coin(275+40,300);
 coins[73] = new Coin(275+40*2,300);
 coins[74] = new Coin(275+40*3,300);
 coins[75] = new Coin(275+40*4,300);
 coins[76] = new Coin(275+40*5-3,300);
 coins[77] = new Coin(275+40*6-5,300);
 coins[78] = new Coin(275+40*7-10,300);
 coins[79] = new Coin(275+40*7+70,300);
 coins[80] = new Coin(275+40*7+70,340);
 coins[81] = new Coin(275+40*6+20,340);
 coins[82] = new Coin(275+40*7+70,340);
 coins[83] = new Coin(275+40*7+70,340);
 coins[84] = new Coin(185,340);
 coins[85] = new Coin(185+90,340);
 coins[86] = new Coin(185+45,380);
 //
 coins[87] = new Coin(185,380);
 coins[88] = new Coin(185+90,380);
 coins[89] = new Coin(260+185+90,380);
 coins[90] = new Coin(260+185+90+50,380);
 coins[91] = new Coin(260+185+80*50*2,380);
 coins[92] = new Coin(625,380);
 //
 coins[93] = new Coin(40,800-40);
 coins[94] = new Coin(40*2,800-40);
 coins[95] = new Coin(40*3,800-40);
 coins[96] = new Coin(40*4,800-40);
 coins[97] = new Coin(40*5,800-40);
 coins[98] = new Coin(40*6,800-40);
 coins[99] = new Coin(40*7,800-40);
 coins[100] = new Coin(40*8,800-40);
 coins[101] = new Coin(40*9,800-40);
 coins[102] = new Coin(612-40*4,800-40);
 coins[103] = new Coin(612-40*3,800-40);
 coins[104] = new Coin(612-40*2,800-40);
 coins[105] = new Coin(612-40*1,800-40);
 coins[106] = new Coin(612,800-40);
 coins[107] = new Coin(612+40,800-40);
 coins[108] = new Coin(612+40*2,800-40);
 coins[109] = new Coin(612+40*3,800-40);
 coins[110] = new Coin(800-30,800-40);
 coins[111] = new Coin(40*10,800-40);
 coins[112] = new Coin(40,720);
 coins[113] = new Coin(812-40,720);
 coins[114] = new Coin(812-40-320,720);
 coins[115] = new Coin(812-40-412,720);
 coins[116] = new Coin(40,680);
 coins[117] = new Coin(40+30,680);
 coins[118] = new Coin(40+70,680);
 coins[119] = new Coin(40+110,680);
 coins[120] = new Coin(40+140,680);
 coins[121] = new Coin(40,680);
 coins[122] = new Coin(40+20+200,680);
 coins[123] = new Coin(40+50+200,680);
 coins[124] = new Coin(40+85+200,680);
 coins[125] = new Coin(40+120+200,680);
 coins[126] = new Coin(40+20+380,680);
 coins[127] = new Coin(40+50+380,680);
 coins[128] = new Coin(40+85+380,680);
 coins[129] = new Coin(40+120+380,680);
 coins[130] = new Coin(40,680);
 coins[131] = new Coin(800-120-30,680);
 coins[132] = new Coin(800-70-30,680);
 coins[133] = new Coin(800-30-20,680);
 coins[134] = new Coin(800-20,680);
 coins[135] = new Coin(800-350-180-180,640);
 coins[136] = new Coin(800-350-180-90,640);
 coins[137] = new Coin(800-350-180,640);
 coins[138] = new Coin(800-270,640);
 coins[139] = new Coin(800-90,640);
 coins[140] = new Coin(800-180,640);
 coins[141] = new Coin(800-180,600);
 coins[142] = new Coin(800-180-40,600);
 coins[143] = new Coin(800-180-40*2,600);
 coins[144] = new Coin(800-180-40*3,600);
 coins[145] = new Coin(800-180-40*4,600);
 coins[146] = new Coin(800-180-40*5,600);
 coins[147] = new Coin(800-180-40*6,600);
 coins[148] = new Coin(800-180-40*7,600);
 coins[149] = new Coin(800-180-40*8,600);
 coins[150] = new Coin(800-180-40*9,600);
 coins[151] = new Coin(800-180-40*10,600);
 coins[152] = new Coin(800-180-40*11,600);
 coins[153] = new Coin(800-180-40*13-10,600);
 coins[154] = new Coin(800-180-40*14-25,600);
 coins[155] = new Coin(680+800-180-40*13-10,600);
 coins[156] = new Coin(680+800-180-40*14-30,600);
 coins[157] = new Coin(680+800-180-40*14+30,560);
 
 coins[159] = new Coin(680+800-180-40*14-120,560);
 coins[160] = new Coin(680+800-180-40*14-290,560);
 coins[161] = new Coin(680+800-180-40*14-290-90,560);
 coins[162] = new Coin(680+800-180-40*14-290-90-180,560);
 coins[163] = new Coin(680+800-180-40*14-290-90-180-145,560);
 coins[164] = new Coin(680+800-180-40*14-290+40,520);
 coins[165] = new Coin(680+800-180-40*14-290+80,520);
 coins[166] = new Coin(680+800-180-40*14-290+120,520);
 coins[167] = new Coin(680+800-180-40*14-290+160,520);
 coins[168] = new Coin(680+800-180-40*14-290+200,520);
 coins[169] = new Coin(680+800-180-40*14-290+240,520);
 coins[158] = new Coin(680+800-180-40*14-290,520);
 coins[170] = new Coin(680+800-180-40*14-290+240+40,520);
 coins[171] = new Coin(680+800-180-40*14-290+240+80,520);
 coins[172] = new Coin(-455+680+800-180-40*14-290+40,520);
 coins[173] = new Coin(-455+680+800-180-40*14-290+80,520);
 coins[174] = new Coin(-455+680+800-180-40*14-290+120,520);
 coins[175] = new Coin(-455+680+800-180-40*14-290+160,520);
 coins[176] = new Coin(-455+680+800-180-40*14-290+200,520);
 coins[177] = new Coin(-455+680+800-180-40*14-290+240,520);
 coins[178] = new Coin(-455+680+800-180-40*14-290,520);
 coins[179] = new Coin(-455+680+800-180-40*14-290+240+40,520);
 coins[180] = new Coin(-455+680+800-180-40*14-290+240+80,520);
 coins[181] = new Coin(-455+680+800-180-40*14-290+240+125,520);
 enemies[0] = new Enemy(20,15,loadImage("ghost_green.png"));
 enemies[1] = new Enemy(745,15,loadImage("ghost_red.png"));
 enemies[2] = new Enemy(745,725,loadImage("ghost_yellow.png"));
 enemies[3] = new Enemy(20,725,loadImage("ghost_pink.png"));
 
 
}
void draw(){
 println(points);
 background(0);
 fill(255);
 textSize(40);
 text("Punkte: "+points,300,900);
 image(mapImage,0,0); 
 
 pacman.animate();
 for (int i = 0; i < coins.length;i++){
   Coin currCoin = coins[i];
   
   currCoin.animate();
 }
 for (Enemy e: enemies){
    e.animate(); 
 }
 if (inGame)
    handleGameKeys(key);

 
}
void keyPressed(){
  
  
  
}
void handleGameKeys(char input){

  switch(input){
    case 'w':
      pacman.move(0,-playerStepSize);
      break;
    case 's':
      pacman.move(0,playerStepSize);
      break;
    case 'a':
      pacman.move(-playerStepSize,0);
      break;
    case 'd':
      pacman.move(playerStepSize,0);
      break;
    
  }
  
}
