import '../../domain/entity/user_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel extends UserResponseEntity {
  const UserResponseModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.createdAt,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
