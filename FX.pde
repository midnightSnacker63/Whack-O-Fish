//effects for things
class FX
{
  float xPos, yPos;
  
  int lifeSpan = millis()+100;
  
  boolean active = true;
  public FX(float x, float y, int t)
  {
    xPos = x;
    yPos = y;
  }
  
  void drawFx()
  {
    if(millis() > lifeSpan)
    {
      active = false;
    }
    if(active)
    {
      push();
      
      image(whackEffect,xPos,yPos,100,100);
      pop();
    }
  }
}
