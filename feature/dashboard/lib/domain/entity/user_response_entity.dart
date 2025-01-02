// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserResponseEntity extends Equatable {
  const UserResponseEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? createdAt;

  UserResponseEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? createdAt,
  }) {
    return UserResponseEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, name, email, phone, createdAt];
}
