part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class IsLoggedInEvent extends LoginEvent {

}

class OpenLoginPageEvent extends LoginEvent {

}

class LoginBtnEvent extends LoginEvent {
  final String phoneNumber;
  final String password;

  LoginBtnEvent({required this.phoneNumber, required this.password});

}

class OpenEditProfilePageEvent extends LoginEvent {

}

class DoneBtnEditProfilePageEvent extends LoginEvent {

}

class LogoutBtnEvent extends LoginEvent {

}

class IsLoadingEvent extends LoginEvent {

}

class CheckUserExistsEvent extends LoginEvent {
  final String accessToken;

  CheckUserExistsEvent({required this.accessToken});
}
