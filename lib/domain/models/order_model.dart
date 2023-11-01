


import 'package:restaurant_app/domain/models/model.dart';

class OrderModel{
  final String id;
  final String name;
  final String email;
  final String phone;
  final int personCount;
  final String deta;
  final String time;
  final List<OrderModelProduct> products;
  OrderModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.personCount,
    required this.deta,
    required this.time,
    required this.products,
  });

  Map<String,Object> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone":  phone,
    "personCount": personCount,
    "deta": deta,
    "time": time,
    "product": List.generate(products.length, (index) => products[index].toJson()).toList(),
  };
}

class OrderModelProduct{
  final int quantity;
  final MenuModel products;
  OrderModelProduct({required this.quantity,required this.products});

  factory OrderModelProduct.fromJson(Map<String,Object?> json){
    return OrderModelProduct(
        quantity: json["quantity"] as int,

        products: MenuModel.fromJson(json["products"] as Map<String,Object?>));
  }

  Map<String,Object> toJson() => {
    "quantity":quantity,
    "products" : products.toJson(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelProduct &&
          runtimeType == other.runtimeType &&
          quantity == other.quantity &&
          products == other.products;

  @override
  int get hashCode => quantity.hashCode ^ products.hashCode;
}
