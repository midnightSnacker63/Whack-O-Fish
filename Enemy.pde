class Enemy
{
  float xPos,yPos;
  float xSpd,ySpd;
  float speed;
  float size = 100;
  float spdMulti = 1;//multiplier for speed;
  
  int type;
  int maxHealth = 1;
  int health = maxHealth;
  
  boolean active;
  boolean harmful;//if attacked you get hurt

  
  public Enemy(float x, float y, int t)
  {
    xPos = x;
    yPos = y;
    
    type = t;
    setTraits();
    
    health = maxHealth;
    if(xPos > width || xPos < 0)//only spawn if it starts off screen
      active = true;
    
    if(xPos > width / 2)//determines the direction they go based on where they spawn
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
      image(enemyImageRight[type],xPos,yPos,size,size);
    else if(xSpd < 0 && active)
      image(enemyImageLeft[type],xPos,yPos,size,size);
      
    if(xPos > width + 450 || xPos < -450)
    {
      active = false;
    }
    
  }
  
  void moveEnemy()
  {
    xPos += xSpd * spdMulti;
    yPos += ySpd * spdMulti;
    
    if(p.health <= 0)//when you die then they scatter
    {
      spdMulti = 5;
    }
    
  }
  
  void setTraits()
  {
    switch(type)
    {
      case 0://small fry
        maxHealth = 1;
        speed = 5;

        return;
      case 1://blob fish
        maxHealth = 5;
        speed = 2.5;
        return;
      case 2://puffer
        maxHealth = 3;
        speed = 7;
        harmful = true;
        return;
      case 3://big fish
        maxHealth = 15;
        speed = 5;
        size = 150;
        return;
      case 4://piranha
        maxHealth = 1;
        speed = 12;
        size = 75;
        harmful = true;
        return;
    }
  }
  
  void takeDamage(int amount)
  {
    health -= amount;
    spdMulti *= 0.85;
    if(health <= 0 )
    {
      if(!harmful)//add score if non harmful
        score+=maxHealth;
      if(harmful)//remove score if harmful
        score-=maxHealth;
      active = false;
      
      return;
    }
  }
}
