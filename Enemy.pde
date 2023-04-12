class Enemy extends AABB {
  
  Enemy() {
    x = player.x;
    y = player.y;
    setSize(100, 100);
  }
  
  void update() {
    
    
    super.update();
  }
  
  void draw() {
    fill(255, 0, 0);
    rect(x-halfW, y-halfH, w, h);
  }
}
