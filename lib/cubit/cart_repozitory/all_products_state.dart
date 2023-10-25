part of 'all_products_cubit.dart';

abstract class AllProductsState extends Equatable {
 final List<MenuModel> products;
  const AllProductsState({required this.products});
 @override
 List<Object> get props => [products];
}

class AllProductsInitial extends AllProductsState {
  const AllProductsInitial({required super.products});
}

class GetAllProducts extends AllProductsState {
  const GetAllProducts({required super.products});
}

class  AllProductsLoading extends AllProductsState {
  const AllProductsLoading({required super.products});
}

class  AllProductsFailure extends AllProductsState {
  final String message;
  const AllProductsFailure({required super.products,required this.message});
}
