static public class Inventory {

  static public IntDict inventory;

  public static void update() {
  }

  public static void draw() {
  }

  public static void createInventory() {
    inventory = new IntDict();
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
      inventory.set(itemName, numItems); 
        if (inventory.get(itemName) <= 0);
        inventory.remove(itemName);
      }
    }
  }
