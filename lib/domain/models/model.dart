

class MenuModel {
  final String id;
  final String name;
  final String description;
  final num price;
  final String imageUrl;
  final String category;

  const MenuModel(
      {required this.id,
      required this.name,
      required this.description,
        required this.category,
      required this.price,
      required this.imageUrl,
      });

  factory MenuModel.fromJson(Map<String, Object?> json) {
    return MenuModel(
        id: json["id"] as String,
        name: json["name"] as String,
        description: json["description"] as String,
        category: json["category"] as String,
        price: json["price"] as num,
        imageUrl: json["imageUrl"] as String,
    );
  }

  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category" : category,
        "price": price,
        "imageUrl": imageUrl,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          imageUrl == other.imageUrl &&
          category == other.category;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      category.hashCode;

  @override
  String toString() {
    return 'MenuModel{id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, category: $category}';
  }
}

class CartItem {
  final String id;
  int quantity;
  num total;
  final MenuModel products;

  CartItem({
    required this.id,
    this.quantity = 1,
    required this.products,
  }) : total = products.price * quantity;

  CartItem copyWith({String? id, int? quantity, MenuModel? products}){
    return CartItem(id: id ?? this.id, products: products ?? this.products,quantity: quantity ?? this.quantity);
  }

  factory CartItem.fromJson(Map<String,Object?> json){
    return CartItem(
        id: json["id"] as String,
        products: MenuModel.fromJson(json["products"] as Map<String,Object?>),
    );
  }


  Map<String,Object> toJson() =>{
    "id": id,
    "quantity": quantity,
    "total": total,
    "products": products.toJson(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          quantity == other.quantity &&
          total == other.total &&
          products == other.products;

  @override
  int get hashCode =>
      id.hashCode ^ quantity.hashCode ^ total.hashCode ^ products.hashCode;

}


//
// const List <MenuModel> productsMock = [
//   MenuModel(id: "1", name: "Spaghetti Bolognese", description: "description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1description1", category: "",  price: 1000, imageUrl: ["https://2.bp.blogspot.com/-9ba1jdL8WnQ/VXfCRGd1WwI/AAAAAAAAAO8/IYmReGmcPKc/s1600/Spaghetti.jpg"],),
//   MenuModel(id: "2", name: "Grilled Salmon", description: "description2", category: "",  price: 2000, imageUrl: ["https://img.taste.com.au/zqEmOof-/taste/2020/01/spicy-sugar-grilled-salmon-with-zucchini-salad-157591-1.jpg","https://img.taste.com.au/zqEmOof-/taste/2020/01/spicy-sugar-grilled-salmon-with-zucchini-salad-157591-1.jpg"]),
//   MenuModel(id: "3", name: "Margherita Pizza", description: "description3",  category: "", price: 3000, imageUrl: ["http://s3-eu-west-1.amazonaws.com/straus/media/products2/9ed1acca61de4bcaac5d8ce2fef79df6.jpg"]),
//   MenuModel(id: "4", name: "Chicken Tikka Masala", description: "description4", category: "",  price: 4000, imageUrl: ["https://avatars.mds.yandex.net/i?id=93d1039a39c4163cb0067d58269f148203dc3cdf-9849146-images-thumbs&n=13"]),
//   MenuModel(id: "5", name: "Caesar Salad", description: "description5", category: "",  price: 5000, imageUrl: ["https://avatars.dzeninfra.ru/get-zen_doc/1675790/pub_5faa92ca3b7ff25f309e42ca_5faa96959c3dc81f90fc3153/scale_1200"]),
//   MenuModel(id: "6", name: "Beef Burger", description: "description6",  category: "", price: 6000, imageUrl: ["https://kartinkin.net/uploads/posts/2022-08/1661214768_6-kartinkin-net-p-burger-king-chiken-barbekyu-vkontakte-11.jpg"]),
//   MenuModel(id: "7", name: "Sushi Platter", description: "description7",  category: "", price: 7000, imageUrl: ["https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/video/GtuAR0I/videoblocks-japanese-food-concept-catering-various-kinds-of-sushi-on-plate-or-platter-set-chopsticks-ginger-soy-sauce-wasabi-placed-on-stone-black-background-in-plastic-delivery-box_hgfnzxztx_thumbnail-1080_01.png"]),
//   MenuModel(id: "8", name: "Pad Thai", description: "description8",  category: "", price: 8000, imageUrl: ["https://i.pinimg.com/originals/5f/d6/97/5fd6976a632239e95d96d4f4f8310c0c.jpg"]),
//   MenuModel(id: "9", name: "Chicken Alfredo Pasta", description: "description9",  category: "", price: 9000, imageUrl: ["https://i.pinimg.com/originals/9b/da/c3/9bdac38acede51acda7bea4ecdbda0fa.jpg"]),
//   MenuModel(id: "10", name: "Chocolate Lava Cake", description: "description20", category: "",  price: 20000, imageUrl: ["https://i.pinimg.com/originals/f8/12/93/f8129346b5eba4a3c35b5c42d3cffff2.jpg"]),
// ];
//

