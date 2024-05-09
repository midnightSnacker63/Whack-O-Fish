class Enemy
{
  float xPos,yPos;
  float xSpd,ySpd;
  float size = 70;
  
  int type;
  
  boolean active;
  
  public Enemy(float x, float y, int t)
  {
    xPos = x;
    yPos = y;
    
    type = t;
    
    if(xPos > width || xPos < 0)
      active = true;
      
    
    if(xPos > width / 2)
    {
      xSpd = -5;
    }
    else
    {
      xSpd = 5;
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
}
