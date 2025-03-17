import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/data/user_model.dart';
import 'package:reservation_app/services/local_storage/app_shared_preference.dart';
import 'package:reservation_app/services/networking/authentication_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<IsLoggedInEvent>(_onIsLoggedInEvent);
    // on<OpenLoginPageEvent>(_onOpenLoginPageEvent);
    on<LoginBtnEvent>(_onLoginBtnEvent);
    // on<OpenEditProfilePageEvent>(_onOpenEditProfilePageEvent);
    // on<DoneBtnEditProfilePageEvent>(_onDoneBtnEditProfilePageEvent);
    on<LogoutBtnEvent>(_onLogoutBtnEvent);
    // on<IsLoadingEvent>(_onIsLoadingEvent);
    // on<CheckUserExistsEvent>(_onCheckUserExistsEvent);

  }



  _onIsLoggedInEvent(IsLoggedInEvent event, Emitter<LoginState> emit) async {
    var accessToken = await AppSharedPreference.readAccessToken();
    if (accessToken != null) {
      add(CheckUserExistsEvent(accessToken: accessToken));
    } else {
      emit(LoginFailureState());
    }
  }

  _onOpenLoginPageEvent(OpenLoginPageEvent event, Emitter<LoginState> emit) async {
  }

  _onLoginBtnEvent(LoginBtnEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    // Gọi API sau đó API trả về kết quả
    var token = await AuthenticationServices.onUserLogin(
        event.phoneNumber, event.password);

    if (token != null) {
      await AppSharedPreference.writeAccessToken(token);
      add(CheckUserExistsEvent(accessToken: token));
    } else {
      emit(LoginFailureState());
    }
  }

  _onOpenEditProfilePageEvent(OpenEditProfilePageEvent event, Emitter<LoginState> emit) async {
  }

  _onLogoutBtnEvent(LogoutBtnEvent event, Emitter<LoginState> emit) async {
    await AppSharedPreference.deleteAccessToken();
    await AppSharedPreference.deleteUserInfo();

    emit(LogoutState());
  }

  _onIsLoadingEvent(IsLoadingEvent event, Emitter<LoginState> emit) async {
  }

  _onCheckUserExistsEvent(CheckUserExistsEvent event, Emitter<LoginState> emit) async {
    //// Gọi API sau đó API trả về kết quả
    var userInfo =
        await AuthenticationServices.getUserInfoFromServer(event.accessToken);

    emit(LoginSuccessState(userData: userInfo));
  }



  FutureOr<void> _onDoneBtnEditProfilePageEvent(DoneBtnEditProfilePageEvent event, Emitter<LoginState> emit) {
  }
}


