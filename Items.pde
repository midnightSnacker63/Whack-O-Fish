class Items
{
  float xPos,yPos;
  float xSpd, ySpd;
  
  int type;
  
  boolean harmful;
  boolean active;
  public Items(float x, float y, int t)
  {
    xPos = x;
    yPos = y;
    
    type = t;
    active = true;
    if(yPos > height/2)
      ySpd = -5;
    else if(yPos < height/2)
      ySpd = 5;
  }
  
  void drawItem()
  {
    image(itemImage[type],xPos,yPos);
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
      active = false;
    }
  }
}
