import 'dart:io';
import 'package:auth/login/application/login_state.dart';
import 'package:auth/login/application/login_status.dart';
import 'package:auth/login/domain/usecase/forgot_password_usecase.dart';
import 'package:auth/login/domain/usecase/register_fcm_token_usecase.dart';
import 'package:auth/login/domain/usecase/user_login.dart';
import 'package:auth/register/domain/usecase/user_register.dart';
import 'package:core/cache/constants/cache_keys.dart';
import 'package:core/cache/shared/shared_manager.dart';
import 'package:core/exception/app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required UserLoginUsecase userLoginUseCase,
    required ForgotPasswordUsecase forgotPasswordUsecase,
    required RegisterFcmTokenUsecase registerFcmTokenUsecase,
    required UserRegisterUsecase registerUserUsecase,
  })  : _userLoginUseCase = userLoginUseCase,
        _forgotPasswordUsecase = forgotPasswordUsecase,
        _registerFcmTokenUsecase = registerFcmTokenUsecase,
        _registerUserUsecase = registerUserUsecase,
        super(LoginState.initial());

  final UserLoginUsecase _userLoginUseCase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final RegisterFcmTokenUsecase _registerFcmTokenUsecase;
  final UserRegisterUsecase _registerUserUsecase;
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: LoginStatus.loading));

      final result = await _userLoginUseCase.call(UserLoginParams(
        email: state.email!,
        password: state.password!,
      ));

      result.fold(
        (error) {
          print("error: ${error.message}");
          emit(state.copyWith(status: LoginStatus.error, exception: error));
        },
        (response) async {
          print("success response: $response");

          emit(state.copyWith(
            status: LoginStatus.completed,
            loginResponse: response,
          ));
          await registerFcmToken();
        },
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await GoogleSignIn().signIn();
      if (account == null) return;

      final authentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );

      final user = await FirebaseAuth.instance.signInWithCredential(credential);

      // Backend'e Google ile giriş yapan kullanıcıyı kaydet
      final result = await _userLoginUseCase.call(UserLoginParams(
        email: user.user!.email!,
        password: user.user!.uid,
      ));

      result.fold(
        (error) async {
          if (error.message == "Email or password is incorrect") {
            final result = await _registerUserUsecase.call(UserRegisterParams(
              email: user.user!.email!,
              password: user.user!.uid,
              name: user.user?.displayName ?? "unknown",
              phone: user.user?.phoneNumber ?? "1111111111",
            ));

            result.fold(
              (error) {
                emit(state.copyWith(status: LoginStatus.error, exception: error));
              },
              (response) async {
                emit(state.copyWith(status: LoginStatus.completed, loginResponse: response));
                await SharedManager.instance!.saveStringValue(CacheKeys.token.name, response.token);
                await registerFcmToken();
              },
            );
          } else {
            emit(state.copyWith(status: LoginStatus.error, exception: error));
          }
        },
        (response) async {
          emit(state.copyWith(status: LoginStatus.completed, loginResponse: response));
          await SharedManager.instance!.saveStringValue(CacheKeys.token.name, response.token);
          await registerFcmToken();
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.error, exception: AppException(message: e.toString())));
    }
  }

  Future<void> forgotPassword() async {
    final result = await _forgotPasswordUsecase.call(ForgotPasswordUsecaseParams(
      email: state.email!,
    ));

    result.fold(
      (error) {
        emit(state.copyWith(status: LoginStatus.error, exception: error));
      },
      (response) {
        emit(state.copyWith(status: LoginStatus.completed));
      },
    );
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void clearException() {
    emit(state.copyWith(exception: AppException(message: "")));
  }

  Future<void> registerFcmToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print("token: $token");

    if (token == null) return;

    final result = await _registerFcmTokenUsecase.call(RegisterFcmTokenParams(
      token: token,
      userId: state.loginResponse!.userId,
      platform: Platform.isAndroid ? "android" : "ios",
    ));

    result.fold(
      (error) {
        emit(state.copyWith(status: LoginStatus.error, exception: error));
      },
      (response) {},
    );
  }
}
