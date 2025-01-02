import 'package:auth/login/domain/entity/login_dto_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_dto_model.g.dart';

@JsonSerializable()
class LoginDtoModel extends LoginDtoEntity {
  const LoginDtoModel({
    required super.email,
    required super.password,
  });

  factory LoginDtoModel.fromJson(Map<String, dynamic> json) => _$LoginDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoModelToJson(this);
}
