//Whack-O-Fish 
//Created by: MidnightSnacker

ArrayList<Enemy> enemies = new ArrayList<Enemy>();

PImage [] enemyImageLeft = new PImage[10];
PImage [] enemyImageRight = new PImage[10];

void setup()
{
  size(1600,900);
  loadImages();
  imageMode(CENTER);
}
void draw()
{
  background(0,0,255);
  handleEnemies();
  enemies.add(new Enemy(random(-150,width+150),random(height),0));
}

void mousePressed()
{
  enemies.add(new Enemy(mouseX,mouseY,0));
}

void handleEnemies()
{
  for(int i = 0; i < enemies.size(); i++)
  {
    enemies.get(i).drawEnemy();
    enemies.get(i).moveEnemy();
    if(!enemies.get(i).active)
    {
      enemies.remove(i);
      println("Poof!");
    }
  }
}

void loadImages()
{
  enemyImageLeft[0] = loadImage("smallFryLeft.png");
  enemyImageLeft[0].resize(70,0);
  enemyImageRight[0] = loadImage("smallFry.png");
  enemyImageRight[0].resize(70,0);
}
