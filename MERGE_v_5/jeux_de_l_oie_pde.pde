//Alex+Lucas
//game functions

/*void initBoard(int[] tab) {
  for (int i = 0; i < 64; i++) {
    tab[i] = i;
  }
}*/
// Renvoie la valeur X pour la position
int getX(int id ) {
  return id%nCol;
}
// Renvoie la valeur Y pour la position
int getY(int id) {
  return id/nCol;
}
//Renvoie les position X d'origine du plateau de jeu, pour chaque case
int getXorigin(int id){
  return 200+getX(id)*100; 
}
//Renvoie les position Y d'origine du plateau de jeu, pour chaque case
int getYorigin(int id){
  return 100+getY(id)*100;
}
//Récupère la valeur X pour déterminer la position de l'oie (du player)
int getXPosGoose(int idGoose){
  if (getX(idGoose) == 0 && idGoose != 0) {
    return 100+9*100;
  }
  return 100+getX(idGoose)*100;
}
//Récupère la valeur Y pour déterminer la position de l'oie (du player)
int getYPosGoose(int idGoose){
  if (getX(idGoose) == 0 && idGoose != 0) {
    return getY(idGoose)*100;
  }
  return 100+getY(idGoose)*100;
}

/*void affPosOieFinal(int idGoose){
  int X = getXPosGoose(idGoose);
  int Y = getYPosGoose(idGoose);
  
  println("Position oie gagnante X : " + X);
  println("Position oie gagnante Y : " + Y);
}*/

int[] diceRoller() {
  dice1 = int(random(1, 7));
  dice2 = int(random(1, 7));

  return new int[]{dice1, dice2}; //dice result
}

int updatePosition(int playerPos, int[] resDice, int[][] skipRound) {
  if (playerPos == 19 && skipRound[currentPlayer][0] != 0) {
    skipRound[currentPlayer][0] -= 1;
    return playerPos = 19;
  } else {
    skipRound[currentPlayer][0] = 2;
  }

  int total = resDice[0] + resDice[1];
  println("Total des dés : " + total);

  if (total == 9 && turn < 2) {
    if ((resDice[0] == 6 && resDice[1] == 3 && turn < 2) || (resDice[0] == 3 && resDice[1] == 6 && turn < 2)) {
      println("Joueur n°" + currentPlayer);
      println("6+3 ! Règle spécial ! Direction case 26 !");
      playerPos = 26;
      echangeDeJoueursSiBesoin(playerPos);

      return playerPos;
    } else if ((resDice[0] == 4 && resDice[1] == 5 && turn < 2) || (resDice[0] == 5 && resDice[1] == 4 && turn < 2)) {
      println("Joueur n°" + currentPlayer);
      println("5+4 ! Règle spécial ! Direction case 53 !");
      playerPos = 53;
      echangeDeJoueursSiBesoin(playerPos);

      return playerPos;
    }
  } else if (total == 6 && turn < 2) {
    println("Joueur n°" + currentPlayer);
    println("Un 6 ! Règle spécial ! Direction case 12 !");
    playerPos = 12;
    echangeDeJoueursSiBesoin(playerPos);

    return playerPos;
  }

  playerPos += total;

  if (playerPos == 63) {
    music.pause();
     win = new SoundFile(this,"win.mp3");
      win.play();
    println("You win!");
    checkWin=true;
  }

  if (playerPos > 63) {
    int backward = playerPos - 63;
    playerPos = 63 - backward;

    playerPos = death(playerPos);
    playerPos = goose(playerPos, total);

    echangeDeJoueursSiBesoin(playerPos);

    prison(playerPos);
    playerPos = passeToursDeLaPrison(playerPos);



    println("Joueur n°" + currentPlayer);
    println("Retour case :" + playerPos);

    return playerPos;
  }


  playerPos = goose(playerPos, total);
  playerPos = death(playerPos);
  playerPos = labyrinth(playerPos);
  puits(playerPos);
  playerPos = passeToursDuPuits(playerPos);
  echangeDeJoueursSiBesoin(playerPos);
  prison(playerPos);
  playerPos = passeToursDeLaPrison(playerPos);


  println("** Case actuel : " + playerPos + (" **"));

  return playerPos;
}

void echangeDeJoueursSiBesoin(int playerPos) {
  if (playerPos == 52) {
  } else {
    for (int i = 0; i < numPlayers; i++) {
      if (i != currentPlayer && playerPosition[i] == playerPos) {
        int positionTemporaire = playerPosition[i];
        playerPosition[i] = playerPosition[currentPlayer];
        playerPosition[currentPlayer] = positionTemporaire;
        println("échange de place avec le joueur " + i);
      }
    }
  }
}

boolean puits(int playerPos) {
  if (playerPos == 3) {
  
  for ( int i = 0; i < numPlayers; i++) {
    dansLePuits[i] = false;
  }
    dansLePuits[currentPlayer] = true;
    println("Oh non ! Tu es tombé dans le puit ! Au moins tu as de quoi boire !");
  }
  return dansLePuits[currentPlayer];
}

int passeToursDuPuits(int playerPos) {
  if (dansLePuits[currentPlayer]){
    playerPos = 3;
  }
  return playerPos;
}

int death(int playerPos) {
  if (playerPos == 58) {
    playerPos = 1;
    println("hahaha t'es mort !");
    println("Joueur n°" + currentPlayer);
    println("Retour à la case départ :" + playerPos);
    
    echangeDeJoueursSiBesoin(playerPos);
  }
  return playerPos;
}

int labyrinth(int playerPos) {
  if (playerPos == 42) {
    playerPos = 30;
    println("Le labyrinth ?! Tu te perds et tu retournes à la case 30");
    println("Joueur n°" + currentPlayer);
    println("Case actuel :" + playerPos);
    
    echangeDeJoueursSiBesoin(playerPos);
  }
  return playerPos;
}

int goose(int playerPos, int total) {
  if (playerPos %9 == 0 && playerPos != 63) {
    playerPos += total;
    println("Case de l'oie ! Tu ajoutes ton lancer !");

    if (playerPos > 63) {
      int backward = playerPos - 63;
      playerPos = 63 - backward;
      println("Retour case :" + playerPos);
    }
    echangeDeJoueursSiBesoin(playerPos);
  }
  return playerPos;
}

boolean prison(int playerPos) {
  if (playerPos == 52) {
    for (int i =0; i < numPlayers; i++) {
      dansLaPrison[i] = false;
    }  
    dansLaPrison[currentPlayer] = true;
   for (int i =0; i < numPlayers; i++) {
    if (i !=currentPlayer && playerPosition[i] == 52){
      dansLaPrison[currentPlayer] = false;
    }
    }
  }
  return dansLaPrison[currentPlayer];
}

int passeToursDeLaPrison(int playerPos) {
  if (dansLaPrison[currentPlayer]) {
    playerPos= 52;
  }
  return playerPos;
}

void keyPressed() {
  if (checkWin!=true) {
    if (key == ' ') {
      if (currentPlayer == 0) {
        turn++;
        println(" ---------- ");
        println("Nombre de tours : " + turn);
      }
      
      playerPosInit[currentPlayer] = playerPosition[currentPlayer];
      //posInitPlusDice[currentPlayer] = playerPosInit[currentPlayer] + dice1 + dice2;
      // Si le joueur est toujours dans le puits, ne mettez pas à jour sa position
      if (dansLePuits[currentPlayer]) {
        println("Le joueur " + currentPlayer + " est toujours au fond du puits !");
      } else if                                           (dansLaPrison[currentPlayer]) {
        println("Le joueur " + currentPlayer + " est toujours en taule !");
      } else {
        // Le joueur n'est pas dans le puits, il peut lancer les dés et avancer
        println("Joueur numéro : " + currentPlayer);
        Player =currentPlayer;
        int[] resDice = diceRoller();
        playerPosition[currentPlayer] = updatePosition(playerPosition[currentPlayer], resDice, skipRound);
     ;
      }
      currentPlayer = (currentPlayer + 1) % numPlayers;  // Passer au joueur suivant
      println(" ---------- ");
    }
  } else {
    if (key == 'r') {
      restart();
    }
  }
}

void restart() {
  for (int i=0; i<playerPosition.length; i++) {
    playerPosition[i]=0;
  }
  checkWin=false;
  currentPlayer=0;
  Player=0;
  turn =0;
  for ( int i = 0; i < numPlayers; i++) {
    dansLePuits[i] = false;
  }
  for ( int i = 0; i < numPlayers; i++) {
    dansLaPrison[i] = false;
  }
}
