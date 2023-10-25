part of 'cart_cubit.dart';


class CartState extends Equatable{
 final int id;
 double total;
 List<CartItem> item;
 CartState({required this.id, required this.item}) : total = item.fold(0.0, (sum, element) => sum + element.total);

 CartState copyWith({int? id,List<CartItem>? items}){
  return CartState(id: id ?? this.id,item: items ?? item,);
 }
 @override
 List<Object?> get props => [id,item,total];
}