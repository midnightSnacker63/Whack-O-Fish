//effects for things
class FX
{
  float xPos, yPos;
  float angle = 12;
  
  int lifeSpan = millis()+350;
  int type;
  
  boolean active = true;
  public FX(float x, float y, int t)
  {
    xPos = x;
    yPos = y;
    
    type = t;
    
    angle = random(-1,1);
  }
  
  void drawFx()
  {
    if(millis() > lifeSpan)
    {
      active = false;
    }
    if(active && type == 0)
    {
      push();
      translate(xPos,yPos);
      rotate(angle);
      angle+= 0.25;
      image(whackEffect,0,0,100,100);
      pop();
    }
    if(type == 1)
    {
      push();
      translate(xPos,yPos);
      rotate(angle);
      textAlign(CENTER);
      textSize(35);
      text("YEOWCH!!!",0,0);
      pop();
    }
  }
}
