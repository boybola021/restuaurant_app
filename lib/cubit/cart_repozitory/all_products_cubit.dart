import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/domain/models/model.dart';
import 'package:restaurant_app/services/firebase_services/realtime_database_services.dart';
part 'all_products_state.dart';



class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(const AllProductsInitial(products: []));

  void allData({String? category})async{
    emit(AllProductsLoading(products: state.products));
    try{
      final data = await RDTBService.getAllMenu();
      final sortData = data.where((e) => e.category == category).toList();
      emit(GetAllProducts(products: [...sortData]));
    }catch(e){
      emit(AllProductsFailure(products: state.products,message: "Please check your network"));
    }
  }

}
