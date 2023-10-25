import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/services/firebase_services/realtime_database_services.dart';
import 'package:restaurant_app/packages_all.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderInitialState(orderModel: [],id: 1));

  void orderPostProducts({required OrderModel order, required int id})async{
    emit(OrderLoadingState(orderModel: state.orderModel, id: 1));
    try{
      final uploadData = await RDTBService.orderAdd(order);
      if(uploadData) {
        emit(OrderSuccessfulState(orderModel: [order],
            id: 1,
            message: "Your order has been received"));
      }
      }catch(e){
      emit(const OrderFieldState(orderModel: [], id: 1,message: "Sorry, try again later"));
    }
  }
}

