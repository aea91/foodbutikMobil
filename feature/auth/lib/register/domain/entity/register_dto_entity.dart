// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RegisterDtoEntity extends Equatable {
  const RegisterDtoEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  final String name;
  final String email;
  final String password;
  final String phone;

  @override
  List<Object?> get props => [name, email, password, phone];

  RegisterDtoEntity copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    return RegisterDtoEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
