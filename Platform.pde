class Platform extends AABB {
 
  Platform() {
    x = random(-1500, 1500);
    y = random(-1500, 1500);
    w = random(50, 150);
    h = random(50, 150);
    setSize(w, h);
  }
  
  void update() {
    super.update();
  }
  
  void draw() {
    fill(0);
    rect(x-halfW, y-halfH, w, h);
  }
  
}
