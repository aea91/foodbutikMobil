// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginDtoEntity extends Equatable {
  const LoginDtoEntity({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  LoginDtoEntity copyWith({
    String? email,
    String? password,
  }) {
    return LoginDtoEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
