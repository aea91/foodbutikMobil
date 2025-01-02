// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UpdateUserDtoEntity extends Equatable {
  const UpdateUserDtoEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  final String name;
  final String phone;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, phone, email, password];

  UpdateUserDtoEntity copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
  }) {
    return UpdateUserDtoEntity(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
