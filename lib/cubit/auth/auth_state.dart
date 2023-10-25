part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthFailureState extends AuthState {
  final String message;

  const AuthFailureState({required this.message});
}

class AuthSignUpState extends AuthState {
  final String username;
  final String email;
  final String password;
  final String prePassword;

  const AuthSignUpState(
      {required this.username,
      required this.email,
      required this.password,
      required this.prePassword});

  @override
  List<Object> get props => [username, email, password, prePassword];
}

class AuthSignInState extends AuthState {
  final String email;
  final String password;

  const AuthSignInState({required this.email, required this.password});

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
