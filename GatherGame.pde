// declaring objects
movingBall ball1, ball2; // 2 balls,
character character1; // 1 character, p1

ArrayList<gameObject> gameObjects= new ArrayList<gameObject>(); // ArrayList for 
ArrayList<gameObject> nonPlayerObjects= new ArrayList<gameObject>();

void setup()
{
  size(1280,720); // size is 1280 by 720 pixels
 
  character1 = new character(width/2,height/2,20); // character x=250, y=125, diameter=20                     
  gameObjects.add(character1);

  ballSetup(100);
}

void ballSetup(int ballNumber)
{
  for(int i = 0; i <= ballNumber; i++)
  {
    double randHeight = Math.random() * ( height - 1);
    double randWidth = Math.random() * ( width - 1);
    movingBall ball1 = new movingBall(randHeight, randWidth, 5, 5, 10);
    gameObjects.add(ball1);
    nonPlayerObjects.add(ball1);
  }
}

void draw()
{
  switch(gameState.screen)
  {
    case 0:
      menuScreen();
      break;
    case 1:
      gameScreen();
      break;
    case 2:
      gameDeadScreen();
      break;
    case 3:
      gameOverScreen();
      break;
  }
  
} // draw procedure ends here

void objectsDraw()
{
  
 for(gameObject object: gameObjects)
 {
    object.draw();
 }

}

void playerCollision()
{
  for(gameObject object: nonPlayerObjects)
  {
    if(character1.objectCollision(object))
    {
      text("True",width/2,height/2);
      gameDeadScreen();
    }
  }
}

public void menuScreen() // case 1, first screen
{  
  background(0);
  textAlign(CENTER);
  text("Press enter to start", width/2, height/2);
}

public void gameScreen() // case 2, second screen, actual game 
{
  background(0);
  text(gameState.counter, 10,10);
  text(character1.lives, width/2, 20);
  text(1200, width*0.9, 20);
 
  gameState.tick();
  
  objectsDraw();
  playerCollision();
}

public void gameDeadScreen() // case 3, third screen, if you lose a life
{
  background(0);
  text("WASTED",width/2,height/2);
  character1.lives = character1.lives - 1;                 // removes a life from the counter
  if(character1.lives <= 0)           // if the amount of lives is less than or equal to 0
  {
    gameState.gameEnd();                     // calls the gameEnd procedure, making screen = 3, if screen = 3 then run the gameOverScreen() procedure
  }
}

public void gameOverScreen()
{
  background(0);
  text("Game Over",width/2,height/2);
}

public void keyPressed() // checks keys pressed, not based on movement
{
  if(key == ENTER)
  {
    if(gameState.screen == 0) // if the screen is set to main menu
    {
      gameState.gameStart(); // start the game
    }
  }
}
