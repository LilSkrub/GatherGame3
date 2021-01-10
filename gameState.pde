static class gameState {
 
  static int counter = 0;
  static int screen = 0;
  
  
  public static void tick()
  {
    counter++;
  }
  
public static void gameStart()
{
  screen = 1;
}

public static void gameDead()
{
  screen = 2;
}

public static void gameEnd()
{
  screen = 3;
}


  
}
