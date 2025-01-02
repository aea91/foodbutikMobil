// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'base_jwt_model.g.dart';

@JsonSerializable()
class BaseJwtModel {
  final int userId;
  final int iat;
  final int exp;

  BaseJwtModel({
    required this.userId,
    required this.iat,
    required this.exp,
  });

  factory BaseJwtModel.fromJson(Map<String, dynamic> json) => _$BaseJwtModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseJwtModelToJson(this);

  BaseJwtModel copyWith({
    int? userId,
    int? iat,
    int? exp,
  }) {
    return BaseJwtModel(
      userId: userId ?? this.userId,
      iat: iat ?? this.iat,
      exp: exp ?? this.exp,
    );
  }
}
