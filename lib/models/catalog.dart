class CatalogModel {
  // static final catModle = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel() => catModle;

  static List<Item> items = [
    Item(
        id: 1,
        name: "SGS21Ultra",
        description: "A premium Android smartphone.",
        price: 1199,
        color: "#eeeee4",
        image:
            "https://rukminim1.flixcart.com/image/416/416/xif0q/mobile/j/y/6/-original-imaggj686yhjdrgk.jpeg")
  ];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.image,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "color": color,
        "image": image
      };
}
