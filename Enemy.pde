class Enemy
{
  float xPos,yPos;
  float xSpd,ySpd;
  float speed;
  float size = 100;
  
  int type;
  int maxHealth = 1;
  int health = maxHealth;
  
  boolean active;
  
  public Enemy(float x, float y, int t)
  {
    xPos = x;
    yPos = y;
    
    type = t;
    setTraits();
    
    health = maxHealth;
    if(xPos > width || xPos < 0)
      active = true;
    
    if(xPos > width / 2)
    {
      xSpd = -speed;
    }
    else
    {
      xSpd = speed;
    }
  }
  
  void drawEnemy()
  {
    if(xSpd > 0 && active)
      image(enemyImageRight[type],xPos,yPos);
    else if(xSpd < 0 && active)
      image(enemyImageLeft[type],xPos,yPos);
    
    if(xPos > width + 250 || xPos < -250)
    {
      active = false;
    }
    
  }
  
  void moveEnemy()
  {
    xPos += xSpd;
    yPos += ySpd;
    
  }
  
  void setTraits()
  {
    switch(type)
    {
      case 0:
        maxHealth = 1;
        speed = 5;
        return;
      case 1:
        maxHealth = 5;
        speed = 2.5;
        return;
    }
  }
  
  void takeDamage(int amount)
  {
    health -= amount;
    if(health <= 0)
    {
      score+=maxHealth;
      active = false;
      return;
    }
  }
}
