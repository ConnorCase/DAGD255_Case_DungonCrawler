class Camera {
  float x,y;
  float tx, ty;
  float distance;
  Player target;
  float dx, dy;
 
  Camera(Player p) {
    target = p;
    tx = target.pos.x - width/2;
    ty = target.pos.y - height/2;
    x = tx;
    y = ty;
  }
  
  void update() {
    tx = target.pos.x - width/2;
    ty = target.pos.y - height/2;
    dx = tx - x;
    dy = ty - y;
    distance = sqrt(dx*dx + dy*dy);
    
    x += dx * 0.1;
    y += dy * 0.1;
  }
}
