float dt = 0;
float prevTime = 0;
boolean leftPressed, rightPressed, pLeftPressed, pRightPressed;

final float ZOOM_IN = 1.5, ZOOM_OUT = 0.5;
float zoomAmount = 1;

Player player;
Player player2;
Player camTarget;
Camera camera;



ArrayList<Circle> circles = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

void setup() {
 size(1280, 720);
 noStroke();

 player = new Player(width/2, height/2);
 player2 = new Player(width/2, height/2);
 camera = new Camera(player);
 player.isFocused = true;
 

 
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
    
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.update();
    
    if(b.isDead) bullets.remove(i);
  }
  
  
  
  player.update();
  player2.update();


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
  
  player.draw();
  player2.draw();
  // popMatrix here
  popMatrix();
  
  // Then draw HUD
  
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
