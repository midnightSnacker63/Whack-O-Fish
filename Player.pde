class Player
{
  float xPos,yPos;
  
  
  public Player()
  {
    
  }
  
  void movePlayer()
  {
    xPos = mouseX;
    yPos = mouseY;
  }
  
  void attack()
  {
    for(Enemy e: enemies)
    {
      if(dist(xPos,yPos,e.xPos,e.yPos) < e.size/2)
      {
        e.takeDamage(1);
      }
    }
    fx.add(new FX(mouseX,mouseY,0));
  }
}
