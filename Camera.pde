class Camera {
  float x,y;
  float tx, ty;
  float distance;
  Player target;
  float dx, dy;
 
  Camera(Player p) {
    target = p;
    tx = target.x - width/2;
    ty = target.y - height/2;
    x = tx;
    y = ty;
  }
  
  void update() {
    tx = target.x - (width/2) / zoomAmount;
    ty = target.y - (height/2) / zoomAmount;
    dx = tx - x;
    dy = ty - y;
    distance = sqrt(dx*dx + dy*dy);
    
    x += dx * 0.1;
    y += dy * 0.1;
  }
}
