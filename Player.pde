class Player
{
  float xPos,yPos;
  
  int maxHealth;
  int health;
  public Player()
  {
    maxHealth = 10;
    health = maxHealth;
  }
  
  void movePlayer()
  {
    xPos = mouseX;
    yPos = mouseY;
  }
  
  void attack()
  {
    for(int i = 0; i < enemies.size(); i++)
    {
      if(dist(xPos,yPos,enemies.get(i).xPos,enemies.get(i).yPos) < enemies.get(i).size/2)
      {
        enemies.get(i).takeDamage(1);
        if(enemies.get(i).harmful)
        {
          health --;
        }
      }
    }
    fx.add(new FX(mouseX,mouseY,0));
  }
}
