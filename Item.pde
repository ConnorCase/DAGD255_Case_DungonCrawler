class Item extends AABB {
  
  String itemName;
  PImage img;
  
  Item(String name) {
    x = random(player.x - 1000, player.x + 1000);
    y = random(player.y - 1000, player.y + 1000);
    itemName = name;
    img = loadImage(name + ".png");
    img.resize(100, 100);
    setSize(100, 100);
  }
  
  void update() {
    
    
    super.update();
  }
  
  void draw() {
    image(img, x-halfW, y-halfH);
  }
}
