float dt = 0;
float prevTime = 0;
Player player;
Camera camera;
PVector camPos = new PVector();
float smoothSpeed = 0.125;
ArrayList<Circle> circles = new ArrayList();

void setup() {
 size(1000, 1000);
 
 player = new Player(500, 500);
 camera = new Camera(player);
 
 for(int i = 0; i < 10; i++) {
  Circle c = new Circle(random(1000), random(1000));
  circles.add(c);
 }
}

void draw() {
  // EVERY FRAME
  calcDeltaTime();
  background(255);
  // pushMatrix here.
  translate(-camera.x, -camera.y); // This magical line of code makes Dungeon Crawler possible.
  
  // UPDATE STUFF
  camera.update();
  player.update();


  // LATE UPDATE
  Keyboard.update();
  
  
  // DRAW STUFF
  for(int i = 0; i < circles.size(); i++) {
    circles.get(i).draw();
  }
  player.draw();
  // popMatrix here
  
  // Then draw HUD
  
}

void calcDeltaTime() {
 float currTime = millis();
 dt = (currTime - prevTime) / 1000;
 prevTime = currTime;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}
