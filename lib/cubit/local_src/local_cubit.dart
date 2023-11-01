import 'package:equatable/equatable.dart';
import 'package:restaurant_app/packages_all.dart';
part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());
  
  void getHistoryOrder()async{
    emit(LocalLoadingState());
    try{
      final data = localRepository.readUser().first.history;
      if(data.isNotEmpty){
        emit(LocalOrderGetState(item: data));
      }else{
        emit(const LocalFailureState(message: CustomString.checkData));
      }
    }catch(e){
      emit(const LocalFailureState(message: CustomString.somethingError));
    }
  }

  void createHistoryOrder({required List <OrderModelProduct> item})async{
    emit(LocalLoadingState());
    try{
      bool response = await localRepository.storeHistory(item);
      if(response){
        emit(LocalCreateState(item: item));
      }else{
        emit(const LocalFailureState(message: CustomString.checkData));
      }
    }catch(e){
      emit(const LocalFailureState(message: CustomString.somethingError));
    }
  }

   Future<bool> clearHistoryOrder()async{
    emit(LocalLoadingState());
    try{
      bool response = await localRepository.deleteProduct();
      if(response){
        emit(const LocalOrderCleanState());
        return true;
      }
    }catch(e){
      emit(const LocalFailureState(message: CustomString.somethingError));
      return false;
    }
    return false;
  }

}
