class Bullet extends AABB {
 
  float damage;
  float lifeTime = 4;
  
  Bullet(float x, float y, float angle, float damage) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    setSize(8, 8);
    velocity = new PVector(1800, 1800);
    this.damage = random(damage, damage + 4);
  }
  
  void update() {
    
    lifeTime -= dt;
    
    x += velocity.x * cos(angle) * dt;
    y += velocity.y * sin(angle) * dt;
    
    if(lifeTime <= 0) isDead = true;
    // PREP FOR NEXT FRAME

    super.update();
  }
  
  void draw() {
    fill(#DB800F);
    ellipse(x, y, w, h);
  }
  
}
