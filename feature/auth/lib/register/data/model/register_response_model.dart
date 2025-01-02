import 'package:auth/register/domain/entity/register_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel extends RegisterResponseEntity {
  const RegisterResponseModel({
    required super.userId,
    required super.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
