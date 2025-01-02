// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth/register/application/register_status.dart';
import 'package:core/exception/app_exception.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.status,
    this.exception,
    this.email,
    this.password,
    this.name,
    this.phone,
  });
  final RegisterStatus status;
  final AppException? exception;
  final String? email;
  final String? password;
  final String? name;
  final String? phone;

  factory RegisterState.initial() => RegisterState(status: RegisterStatus.initial);

  @override
  List<Object?> get props => [status, exception, email, password, name, phone];

  RegisterState copyWith({
    RegisterStatus? status,
    AppException? exception,
    String? email,
    String? password,
    String? name,
    String? phone,
  }) {
    return RegisterState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }
}
