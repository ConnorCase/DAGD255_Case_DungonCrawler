class Circle {
  float x, y;
  float diameter;
  
  Circle(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    diameter = random(50, 150);
  }
  
  void update() {
    
  }
  
  void draw() {
    fill(0, 0, 255);
    ellipse(x, y, diameter, diameter);
  }
  
}
