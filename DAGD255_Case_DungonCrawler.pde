float dt = 0;
float prevTime = 0;
boolean leftPressed, rightPressed, pLeftPressed, pRightPressed;

final float ZOOM_IN = 1.5, ZOOM_OUT = 0.5;
float zoomAmount = 1;

Player player;
Player player2;
Player camTarget;
Camera camera;

Enemy enemy;

ArrayList<Circle> circles = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

ArrayList<Item> items = new ArrayList();

float itemSpawnTime = 1;

//Tilemap
//1 is wall
//2 is floor
// int [][] maprow = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
int [][] tilemap = {
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
};
int rows, cols;
int cellWidth, cellHeight;

void setup() {
 size(1280, 720);
 noStroke();

 player = new Player(width/2, height/2);
 player2 = new Player(width/2, height/2);
 camera = new Camera(player);
 player.isFocused = true;
 
 enemy = new Enemy();
 
 Inventory.app = this;
 Inventory.createInventory();
 Inventory.createCells(4, 5, 50, 150);
 
 for(int i = 0; i < 10; i++) {
  Circle c = new Circle(random(width), random(height));
  circles.add(c);
 }
}

void draw() {
  // EVERY FRAME
  calcDeltaTime();
  background(255);
  
  scale(zoomAmount);
  // pushMatrix here.
  pushMatrix();
  translate(-camera.x, -camera.y); // This magical line of code makes Dungeon Crawler possible.
    
  // UPDATE STUFF
  camera.update(); // This must always be the first thing you update.
    
  
  itemSpawnTime -= dt;
  if(itemSpawnTime <= 0) {
    Item i = new Item("Banana");
    items.add(i);
    itemSpawnTime = 1;
  }
  
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.update();
    
    if(b.isDead) bullets.remove(i);
  }
  
  for(int i = 0; i < items.size(); i++) {
    Item b = items.get(i);
    b.update();
    
    if(b.checkCollision(player)) {
      b.isDead = true;
      Inventory.addItems(b.itemName, 1);
    }
    
    if(b.isDead) items.remove(i);
  }
  
  
  enemy.update();
  player.update();
  player2.update();
  
  Inventory.update();


  // LATE UPDATE
  Keyboard.update();
  pLeftPressed = leftPressed;
  pRightPressed = rightPressed;
  
  
  // DRAW STUFF
  for(int i = 0; i < circles.size(); i++) {
    circles.get(i).draw();
  }
  
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.draw();
  }
  
  for(int i = 0; i < items.size(); i++) {
    Item b = items.get(i);
    b.draw();
  }
  
  enemy.draw();
  player.draw();
  player2.draw();
  
  
  // popMatrix here
  popMatrix();
  
  
  
  // Then draw HUD
  if(player.isInventory) Inventory.draw();
  
}

void calcDeltaTime() {
 float currTime = millis();
 dt = (currTime - prevTime) / 1000;
 prevTime = currTime;
}

void mousePressed() {
  if(mouseButton == LEFT) leftPressed = true;
  if(mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if(mouseButton == LEFT) leftPressed = false;
  if(mouseButton == RIGHT) rightPressed = false;
}

void keyPressed() {
  // println(keyCode);
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e > 0) {
    zoomAmount -= 0.05;
    if(zoomAmount <= ZOOM_OUT) zoomAmount = ZOOM_OUT;
  }
  if(e < 0) {
    zoomAmount += 0.05;
    if(zoomAmount >= ZOOM_IN) zoomAmount = ZOOM_IN;
  }
}
