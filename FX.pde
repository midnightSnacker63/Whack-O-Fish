//effects for things
class FX
{
  float xPos, yPos;
  float angle;
  
  int lifeSpan = millis()+200;
  
  boolean active = true;
  public FX(float x, float y, int t)
  {
    xPos = x;
    yPos = y;
    
    angle = random(0,360);
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
      translate(xPos,yPos);
      rotate(angle);
      angle+= 0.25;
      image(whackEffect,0,0,70,70);
      pop();
    }
  }
}
