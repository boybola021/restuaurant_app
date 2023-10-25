import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/services/utils.dart';

import '../../services/strings.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(
      {required String username,
      required String email,
      required String password,
      required String prePassword})async{
    emit(AuthLoadingState());
    try{
     if(Utils.validateRegistration(username, email, password, prePassword)){
      emit(AuthSignUpState(username: username, email: email, password: password, prePassword: prePassword));
     }
    }catch(e){
      emit(const AuthFailureState(message: CustomString.somethingError));
      return;
    }
  }

  void signIn({ required String email, required String password,})async{
    emit(AuthLoadingState());
    try{
        emit(AuthSignInState(email: email, password: password));
    }catch(e){
      emit(const AuthFailureState(message: CustomString.somethingError));
      return;
    }
  }
}
