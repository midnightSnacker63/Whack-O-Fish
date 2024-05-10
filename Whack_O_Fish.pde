//Whack-O-Fish 
//Created by: MidnightSnacker

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<FX> fx = new ArrayList<FX>();

int score;

PImage [] enemyImageLeft = new PImage[10];
PImage [] enemyImageRight = new PImage[10];
PImage whackEffect;

Player p;

void setup()
{
  p = new Player();
  size(1600,900);
  loadImages();
  imageMode(CENTER);
  
  textSize(50);
}
void draw()
{
  background(0,0,255);
  enemies.add(new Enemy(random(-150,width+150),random(height),int(random(0,2))));
  handleEnemies();
  handlePlayer();
  handleFX();
  text("score: "+ score,30,50);
}

void mousePressed()
{  
  p.attack();
}

void handleEnemies()
{
  for(Enemy e: enemies)
  {
    e.drawEnemy();
    e.moveEnemy();
  }
  for(int i = 0; i < enemies.size(); i++)
  {
    if(!enemies.get(i).active)
    {
      enemies.remove(i);
    }
  }
}

void handlePlayer()
{
  
  p.movePlayer();
}

void handleFX()
{
  for(FX f: fx)
  {
    f.drawFx();
  }
  for(int i = 0; i < fx.size(); i++)
  {
    if(!fx.get(i).active) 
    {
      fx.remove(i);
    }
  }
 
}

void loadImages()
{
  enemyImageLeft[0] = loadImage("smallFryLeft.png");
  enemyImageLeft[0].resize(100,0);
  enemyImageRight[0] = loadImage("smallFry.png");
  enemyImageRight[0].resize(100,0);
  enemyImageLeft[1] = loadImage("blobFish.png");
  enemyImageLeft[1].resize(100,0);
  enemyImageRight[1] = loadImage("blobFishRight.png");
  enemyImageRight[1].resize(100,0);
  
  whackEffect = loadImage("explosion.png");
}
