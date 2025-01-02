// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth/login/application/login_status.dart';
import 'package:auth/login/domain/entity/login_response_entity.dart';
import 'package:core/exception/app_exception.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final LoginStatus status;
  final AppException? exception;
  final String? email;
  final String? password;
  final LoginResponseEntity? loginResponse;
  const LoginState({
    required this.status,
    required this.exception,
    required this.email,
    required this.password,
    required this.loginResponse,
  });

  factory LoginState.initial() => const LoginState(
        status: LoginStatus.initial,
        exception: null,
        email: null,
        password: null,
        loginResponse: null,
      );

  @override
  List<Object?> get props => [status, exception, email, password, loginResponse];

  LoginState copyWith({
    LoginStatus? status,
    AppException? exception,
    String? email,
    String? password,
    LoginResponseEntity? loginResponse,
  }) {
    return LoginState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      email: email ?? this.email,
      password: password ?? this.password,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
