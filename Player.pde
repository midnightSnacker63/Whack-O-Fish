class Player
{
  float xPos,yPos;
  
  int maxHealth;
  int health;
  
  int damage = 1;
  
  int attackTimer;
  int attackCooldown = 300;
  
  boolean attacking;
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
        enemies.get(i).takeDamage(damage);
        if(enemies.get(i).harmful)
        {
          health --;
          fx.add(new FX(mouseX,mouseY,1));
          if(health < 0)
          {
            health = 0;
          }
        }
        else
        {
          fx.add(new FX(mouseX,mouseY,0));
        }
      }
    }
    circle(xPos,yPos,50);
  }
}
