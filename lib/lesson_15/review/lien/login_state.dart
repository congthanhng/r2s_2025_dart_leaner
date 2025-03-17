part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class InitialState extends LoginState{
  
}

// class InitialNotLoginState extends LoginState{
//
// }

class LoginSuccessState extends LoginState{
  final UserModel? userData;

  LoginSuccessState({this.userData});

}

class LoginFailureState extends LoginState{
  
}

class LogoutState extends LoginState{
  
}


class LoadingState extends LoginState{

}

// class OpenEditProfilePageState extends LoginState{
//
// }

// class DoneBtnEditProfileState extends LoginState{
//
// }

// class OpenLoginPageState extends LoginState{
//
// }



