class Items
{
  float xPos,yPos;
  float xSpd, ySpd;
  
  float startingPoint;
  
  int type;
  
  boolean harmful;
  boolean healing;
  boolean active;
  public Items(float x, float y, int t)
  {
    xPos = x;
    //yPos = y;
    type = t;
    setTraits();
    yPos = startingPoint;
    if(yPos > height/2)
      ySpd = -5;
    else if(yPos < height/2)
      ySpd = 5;

    active = true;
  }
  
  void drawItem()
  {
    image(itemImage[type],xPos,yPos);
    //circle(xPos,yPos,100);
  }
  
  void moveItem()
  {
    xPos += xSpd;
    yPos += ySpd;
    
    if(yPos > height+250)
    {
      active = false;
    }
    
    if(yPos < -150)
    {
      active = false;
    }
  }
  
  void obtainItem()
  {
    if(dist(p.xPos,p.yPos,xPos,yPos) < 100)
    {
      if(harmful)
        p.health --;
      if(healing && p.health < p.maxHealth)
        p.health ++;
      if(harmful)
      {
        fx.add(new FX(mouseX,mouseY,0));
      }
      active = false;
    }
  }
  
  void setTraits()
  {
    switch(type)
    {
      case 0:
        harmful = true;
        startingPoint = height+150;
        return;
      case 1:
        
        healing = true;
        startingPoint = -100;
        return;
    }
  }
}
