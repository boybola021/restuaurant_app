part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  final int id;
  final List<OrderModel> orderModel;
  const OrderState({required this.orderModel,required this.id});
  @override
  List<Object> get props => [orderModel];
}

class OrderInitialState extends OrderState {
  const OrderInitialState({required super.orderModel, required super.id});
}

class OrderLoadingState extends OrderState{
  const OrderLoadingState({required super.orderModel, required super.id});
}

class OrderSuccessfulState extends OrderState{
  final String message;
  const OrderSuccessfulState({required super.orderModel,required this.message, required super.id});
}

class OrderFieldState extends OrderState{
  final String message;
  const OrderFieldState({required super.orderModel,required this.message, required super.id});
}
