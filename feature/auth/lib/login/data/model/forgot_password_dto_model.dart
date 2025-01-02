import 'package:auth/login/domain/entity/forgot_password_dto_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_dto_model.g.dart';

@JsonSerializable()
class ForgotPasswordDtoModel extends ForgotPasswordDtoEntity {
  const ForgotPasswordDtoModel({
    required super.email,
  });

  factory ForgotPasswordDtoModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordDtoModelToJson(this);
}
