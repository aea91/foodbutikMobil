// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  const LoginResponseEntity({
    required this.userId,
    required this.token,
  });

  final int userId;
  final String token;

  LoginResponseEntity copyWith({
    int? userId,
    String? token,
  }) {
    return LoginResponseEntity(
      userId: userId ?? this.userId,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [userId, token];
}
