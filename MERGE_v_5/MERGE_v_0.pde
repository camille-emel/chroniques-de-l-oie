import processing.sound.*; //<>//
SoundFile music;
SoundFile win;

//images global //<>// //<>//
PImage wall;
PImage stone;
PImage magicgoose;
PImage bg;
PImage maze;
PImage well;
PImage jail;
PImage death;
PImage hotel;
PImage finish;
PImage castle;
PImage start;
PImage sign;
PImage scroll;
PImage dice[] = new PImage[6];
PImage playerOneGoose[] = new PImage[3];
PImage playerTwoGoose[] = new PImage[3];
PImage playerThreeGoose[] = new PImage[3];
PImage playerFourGoose[] = new PImage[3];

//portal global
PImage portal []= new PImage[5];
int frameNum =0;
int frameGoose =0;
int frameDice=0;

//plateau
int nCol =9; //change the number of rows/cols
int nRow =7;
//int [][] plateau = new int [nCol][nRow];


//backend

int[] tab = new int[nCol*nRow];
int numPlayers = 4;
int[] playerPosition = new int[numPlayers];
int currentPlayer;
int Player;
int turn;
int[][] skipRound = new int [6][1];
boolean[] dansLePuits = new boolean[numPlayers];
boolean[] dansLaPrison = new boolean[numPlayers];
int dice1;
int dice2;
int[] playerPosInit = new int[numPlayers];
//int[] posInitPlusDice = new int[numPlayers];

//win
boolean checkWin = false;


void setup() {
  size(1500, 800);
  music = new SoundFile(this, "jeux.mp3");
  music.play();
  music.amp(0.1);

  
  frameRate(15);
  loadImages();
  //initBoard(tab);
    playerOneGoose();
  playerTwoGoose();
  playerThreeGoose();
  playerFourGoose();
  
  for (int i=0; i<numPlayers; i++) {
    skipRound[i][0] = 2;
  }
}

void draw() {
  background(bg);
  drawBoard();
  //affPosOieFinal(62);
  frameGoose++;
  frameGoose %= playerTwoGoose.length;
  imageMode(CENTER);
  
  //press space
  fill(255);
  textSize(20);
  text("Press SPACE to throw dice", 600, 35);

  portals();
  startFinish();
  DisplayDice();
  nPlayer(Player);
  nTurn(turn);
  
  //mouse hover to show info about special cases
  portalReturn ();
  wizardGoose ();
  oiezilla ();
  gooseAround ();
  hotel();
  oieskaban();
  well();
  finishCastle();
  finishBridge ();
  
  if(playerPosition[0] == 0){
    image(playerOneGoose[frameGoose], 100, 100);
  }else{
    if(playerPosInit[0] != playerPosition[0] && playerPosInit[0] < playerPosition[0]){
      if(frameCount %5 == 0){
        playerPosInit[0]++;        
      }
      image(playerOneGoose[frameGoose], getXPosGoose(playerPosInit[0]), getYPosGoose(playerPosInit[0]));
    }/*else if(posInitPlusDice[0] == 42 || posInitPlusDice[0] == 58 || posInitPlusDice[0] > 63){ 
      if (playerPosInit[0] != posInitPlusDice[0] && playerPosInit[0] < posInitPlusDice[0]) {
        playerPosInit[0]++;
      } else if (posInitPlusDice[0] != playerPosition[0] && posInitPlusDice[0] > playerPosition[0]) {
        if (frameCount %5 == 0) {
          playerPosInit[0]--;
        }
      } 
    }*/else if (playerPosInit[0] != playerPosition[0] && playerPosInit[0] > playerPosition[0]){      
      if(frameCount %5 == 0){
        playerPosInit[0]--;        
      }
      image(playerOneGoose[frameGoose], getXPosGoose(playerPosInit[0]), getYPosGoose(playerPosInit[0]));
    }else{
       image(playerOneGoose[frameGoose], getXPosGoose(playerPosition[0]), getYPosGoose(playerPosition[0]));
    }
  }
  
  if(playerPosition[1] == 0){
    image(playerTwoGoose[frameGoose], 100, 100);
  }else{
    if(playerPosInit[1] != playerPosition[1] && playerPosInit[1] < playerPosition[1]){
      if(frameCount %5 == 0){
        playerPosInit[1]++;        
      }
      image(playerTwoGoose[frameGoose], getXPosGoose(playerPosInit[1]), getYPosGoose(playerPosInit[1]));
    }else if (playerPosInit[1] != playerPosition[1] && playerPosInit[1] > playerPosition[1]){
      if(frameCount %5 == 0){
        playerPosInit[1]--;        
      }
      image(playerTwoGoose[frameGoose], getXPosGoose(playerPosInit[1]), getYPosGoose(playerPosInit[1]));
    }else{
       image(playerTwoGoose[frameGoose], getXPosGoose(playerPosition[1]), getYPosGoose(playerPosition[1]));
    }
  }
  
  if(playerPosition[2] == 0){
    image(playerThreeGoose[frameGoose], 100, 100);
  }else{
    if(playerPosInit[2] != playerPosition[2] && playerPosInit[2] < playerPosition[2]){
      if(frameCount %5 == 0){
        playerPosInit[2]++;        
      }
      image(playerThreeGoose[frameGoose], getXPosGoose(playerPosInit[2]), getYPosGoose(playerPosInit[2]));
    }else if (playerPosInit[2] != playerPosition[2] && playerPosInit[2] > playerPosition[2]){
      if(frameCount %5 == 0){
        playerPosInit[2]--;        
      }
      image(playerThreeGoose[frameGoose], getXPosGoose(playerPosInit[2]), getYPosGoose(playerPosInit[2]));
    }else{
       image(playerThreeGoose[frameGoose], getXPosGoose(playerPosition[2]), getYPosGoose(playerPosition[2]));
    }
  }
  
  if(playerPosition[3] == 0){
    image(playerFourGoose[frameGoose], 100, 100); 
  }else{
    if(playerPosInit[3] != playerPosition[3] && playerPosInit[3] < playerPosition[3]){
      if(frameCount %5 == 0){
        playerPosInit[3]++;        
      }
      image(playerFourGoose[frameGoose], getXPosGoose(playerPosInit[3]), getYPosGoose(playerPosInit[3]));
    }else if (playerPosInit[3] != playerPosition[3] && playerPosInit[3] > playerPosition[3]){
      if(frameCount %5 == 0){
        playerPosInit[3]--;        
      }
      image(playerFourGoose[frameGoose], getXPosGoose(playerPosInit[3]), getYPosGoose(playerPosInit[3]));
    }else{
       image(playerFourGoose[frameGoose], getXPosGoose(playerPosition[3]), getYPosGoose(playerPosition[3]));
    }
  }
  
  
    //checkWin
  if (checkWin!=false) {
     
    imageMode(CORNER);
    image(scroll, width/3, height/4);
    textSize(20);
    textAlign(CENTER);
    fill(255);
    if (Player==0) {
      fill(0, 0, 255);
      textSize(20);
      text("Player 1", (width/4)+150, (height/4)+70, 300, 150);
    } else if (Player==1) {
      fill(0, 255, 0);
      textSize(20);
      text("Player 2", (width/4)+150, (height/4)+70, 300, 150);
    } else if (Player==2) {
      fill(255, 0, 0);
      textSize(20);
      text("Player 3", (width/4)+150, (height/4)+70, 300, 150);
    } else if (Player==3) {
      fill(127, 0, 255);
      textSize(20);
      text("Player 4", (width/4)+150, (height/4)+70, 300, 150);
    } else if (Player==4) {
      fill(255, 255, 0);
      textSize(20);
      text("Player 5", (width/4)+150, (height/4)+70, 300, 150);
    } else if (Player==5) {
      fill(0, 255, 255);
      textSize(20);
      text("Player 6", (width/4)+150, (height/4)+50, 300, 150);
    }
    fill(0);
    textSize(20);
    text(" won!", (width/4)+210, (height/4)+70, 300, 150);
    textSize(14);
    text("Press R to restart the game.", (width/4)+180, (height/4)+100, 300, 150);
  }
}

void playerOneGoose() {
  
  for (int i = 0; i<playerOneGoose.length; i++) {
    playerOneGoose[i] = loadImage("tile_p1_"+i+".png");
  }
}
void playerTwoGoose() {
  for (int i = 0; i<3; i++) {
    playerTwoGoose[i] = loadImage("tile_p2_"+i+".png");
  }
}
void playerThreeGoose() {
  for (int i = 0; i<3; i++) {
    playerThreeGoose[i] = loadImage("tile_p3_"+i+".png");
  }
}
void playerFourGoose() {
  for (int i = 0; i<3; i++) {
    playerFourGoose[i] = loadImage("tile_p4_"+i+".png");
  }
}
