//displays the blue dice according to random numbers in the diceRoller() function
void DisplayDice () {
  if (dice1==0 ||dice2==0) {
    frameDice++;
    frameDice %= dice.length;
    image(dice[frameDice], 1275, 400);
    image(dice[frameDice], 1375, 400);
  } else {
    image(dice[dice1 - 1], 1275, 400);
    image(dice[dice2 - 1], 1375, 400);
  }
}


void nPlayer (int Player) {
  if (Player==0) {
    fill(0, 0, 255);
    textSize(20);
    text("Player 1", 1250, 300);
  } else if (Player==1) {
    fill(0, 255, 0);
    textSize(20);
    text("Player 2", 1250, 300);
  } else if (Player==2) {
    fill(255, 0, 0);
    textSize(20);
    text("Player 3", 1250, 300);
  } else if (Player==3) {
    fill(127, 0, 255);
    textSize(20);
    text("Player 4", 1250, 300);
  } else if (Player==4) {
    fill(255, 255, 0);
    textSize(20);
    text("Player 5", 1250, 300);
  } else if (Player==5) {
    fill(0, 255, 255);
    textSize(20);
    text("Player 6", 1250, 300);
  }
  fill(255);
  textSize(20);
  text(" is now playing.", 1350, 300);
}

void nTurn (int turn) {
  fill(255);
  textSize(20);
  text("Round: " + turn, 1380, 330);
}
