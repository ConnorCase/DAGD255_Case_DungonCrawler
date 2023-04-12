class Cell {
  int x, y;
  int w = 100, h = 100;
  boolean isHovered = false;
  
  PImage img;
  int numItems;
  String itemName;

  Cell(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }

  void update() {  
    isHovered = (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) ? true : false;

    if(leftPressed && !pLeftPressed) {
      if(isHovered && player.isInventory) {
        consumeItem();
        Inventory.arrangeItems();
      }
    }
  }

  void draw() {
    

    // Draw Hover GFX
    if (isHovered) {
      fill(255, 128);
      rect(x, y, w, h);
    }
    
    // Draw Hover Descriptions
    if (isHovered) {
      if(itemName == "Apple") {
        textAlign(LEFT, CENTER);
        textSize(20);
        text("This is an apple. It is going to restore your health by 20 points!", width/2, height/2);
      }
    }
    
    // Draw icon
    if (img != null) image(img, x, y);
    
    // Draw Number of Items
    if(numItems > 0) {
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text(numItems, x + w - 15, y + h - 10);
    }

    // Draw border

    noFill();
    stroke(0);
    strokeWeight(5);
    rect(x, y, w, h);
    noStroke();
  }

  void updateSpriteAndNumber(String fileName, int numItems) {
    itemName = fileName;
    img = loadImage(fileName + ".png");
    img.resize(100, 100);
    this.numItems = numItems;
  }
  
  void resetCell() {
    img = null;
    numItems = 0;
    itemName = null;
  }
  
  void consumeItem() {
    if(itemName == "Apple") {
      // Do something with Apple Consumption.
      println("An Apple was consumed.");
    }
    if(itemName == "Banana") {
      println("A Banana was consumed.");
    }
    
    Inventory.removeItems(itemName, 1);
    Inventory.arrangeItems();
  }
}
