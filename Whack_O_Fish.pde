//Whack-O-Fish 
//Created by: MidnightSnacker

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<FX> fx = new ArrayList<FX>();
ArrayList<Items> items = new ArrayList<Items>();

int score;
int enemyTimer;
int enemyCooldown = 100;
int itemTimer = 3000;
int itemCooldown = 5000;

PImage [] enemyImageLeft = new PImage[10];
PImage [] enemyImageRight = new PImage[10];

PImage [] itemImage = new PImage[10];

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
  handleEnemies();
  handlePlayer();
  handleFX();
  handleItems();
  drawHUD();
}

void mousePressed()
{  
  if(mouseButton == LEFT && p.health > 0)
  {
    p.attack();
    for(int i = 0; i < items.size(); i++)
    {
      items.get(i).obtainItem();
    }
  }
  //items.add(new Items(random(50,width-50),0,int(random(0,2))));
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
  if(millis() > enemyTimer)
  {
    enemies.add(new Enemy(-150,random(height-50),int(random(0,3))));
    enemies.add(new Enemy(width+150,random(height-50),int(random(0,3))));
    enemyTimer = millis() + enemyCooldown;
    enemyCooldown = int(random(500,1500));
  }
}

void handlePlayer()
{
  p.movePlayer();
  if(p.health <= 0)
  {
    enemies.clear();
  }
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

void handleItems()
{
  for(Items i: items)
  {
    i.drawItem();
    i.moveItem();
  }
  for(int i = 0; i < items.size(); i++)
  {
    if(!items.get(i).active)
    {
      items.remove(i);
    }
  }
  if(millis() > itemTimer)
  {
    items.add(new Items(random(50,width-50),0,int(random(0,2))));
    itemTimer = millis() + itemCooldown;
    itemCooldown = int(random(3000,20000));
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
  enemyImageLeft[2] = loadImage("pufferPlaceholderLeft.png");
  enemyImageLeft[2].resize(100,0);
  enemyImageRight[2] = loadImage("pufferPlaceholderRight.png");
  enemyImageRight[2].resize(100,0);
  enemyImageLeft[3] = loadImage("pufferPlaceholderLeft.png");
  enemyImageLeft[3].resize(100,0);
  enemyImageRight[3] = loadImage("pufferPlaceholderRight.png");
  enemyImageRight[3].resize(100,0);
  
  itemImage[0] = loadImage("waterMineUp.png");
  itemImage[0].resize(100,0);
  itemImage[1] = loadImage("healthPack.png");
  itemImage[1].resize(100,0);
  
  whackEffect = loadImage("explosion.png");
}

void drawHUD()
{
  text("score: "+ score,30,50);
  push();//health bar
  rectMode(CORNER);
  fill(200,200,200); 
  rect(31, 71, (p.maxHealth*20)+8, 28);
  fill(0);
  rect(35, 75, p.maxHealth*20, 20);
  fill(255, 10, 0);
  rect(35, 75, p.health*20, 20);
  pop();
  if(p.health <= 0)//whenever you die
  {
    push();
    textAlign(CENTER);
    text("YOU LOSE",width/2,height/2);
    textSize(30);
    text("Final Score: "+score,width/2,height/2+30);
    pop();
  }
}
