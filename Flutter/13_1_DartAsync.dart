import 'dart:math';


Future<void> main() async {
  print("Loading items....");
  
  for(int i = 0; i < 10; i++){
    //print(Repository.returnMyItem());
    /*asyncrounusly
     * Repository.returnMyItemFuture().then(
      (value){
        print(value);
      });*/
    //syncrounusly
    //Item item = await Repository.returnMyItemFuture();
    //print(item);
    
    Future<Item> futureItem = Repository.returnMyItemFuture();
    futureItem.then(
      (item){
        print(item);
      });
    
  }

  print("done");
}


class Repository{
  
  
  ///
  /// Asyncrounusly
  /// Item -> Future<Item>
  static Future<Item> returnMyItemFuture() async{
    var rnd = new Random();
    int random = rnd.nextInt(3);
    
    Item myItem = Item();
    
    await Future.delayed(Duration(seconds: random));
    return myItem;
  }
  
  ///
  /// Syncrounusly
  ///
  static Item returnMyItem(){
    return Item();
  }
}


class IDGenerator{
  static int _itemId = 0;
  
  static int get itemId => _itemId++;
  
}

class Item{
  late int itemId;
  
  Item(){
    this.itemId = IDGenerator.itemId;
  }
  
  @override String toString(){
    return "Item Id is: $itemId";
  }
  
}
