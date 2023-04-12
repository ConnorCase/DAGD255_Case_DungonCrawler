static public class Inventory {

  static public IntDict inventory;
  static public DAGD255_Case_DungonCrawler app;
  static private Cell[][] cells;

  static private String[] keys;

  public static void update() {
    for (int Y = 0; Y < cells.length; Y++) {
      for (int X = 0; X < cells[0].length; X++) {
        Cell cell = cells[Y][X];
        cell.update();
      }
    }


    keys = inventory.keyArray();
    // println(keys.length);
    
    if(app.player.isInventory) arrangeItems();
  }

  public static void draw() {
    app.fill(128);
    app.rect(0, 0, app.width, app.height);

    app.fill(255);
    app.textAlign(CENTER, CENTER);
    app.textSize(40);
    app.text("INVENTORY", app.width/2, 50);

    for (int Y = 0; Y < cells.length; Y++) {
      for (int X = 0; X < cells[0].length; X++) {
        Cell cell = cells[Y][X];
        cell.draw();
      }
    }
  }

  public static void createInventory() {
    inventory = new IntDict();
  }

  public static void createCells(int rows, int cols, int xOffset, int yOffset) {
    int ROWS = rows;
    int COLS = cols;
    cells = new Cell[ROWS][COLS];

    for (int Y = 0; Y < ROWS; Y++) {
      for (int X = 0; X < COLS; X++) {
        Cell cell = app.new Cell(xOffset + X * 100, yOffset + Y * 100);
        cells[Y][X] = cell;
      }
    }
  }

  public static void addItems(String itemName, int numItems) {
    if (inventory.hasKey(itemName)) {
      inventory.add(itemName, numItems);
    } else {
      inventory.set(itemName, numItems);
    }
  }

  public static void removeItems(String itemName, int numItems) {
    if (inventory.hasKey(itemName)) {
      inventory.sub(itemName, numItems);
      if (inventory.get(itemName) <= 0) {
        inventory.remove(itemName);
      }
    }
  }

  public static void sortInventory() {
    inventory.sortKeys();
  }

  public static void arrangeItems() {
    int rowMax = cells.length - 1;
    int colMax = cells[0].length - 1;    
    int i = 0;

    for (int Y = 0; Y <= rowMax; Y++) {      
      for (int X = 0; X <= colMax; X++) {
        if (i > keys.length - 1) continue;
        String item = keys[i];
        if (inventory.hasKey(item)) {
          cells[Y][X].updateSpriteAndNumber(item, inventory.get(item));
          i++;
        } else {
          cells[Y][X].resetCell();
        }
      }
    }
  }
}
