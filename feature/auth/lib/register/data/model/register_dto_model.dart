import 'package:auth/register/domain/entity/register_dto_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_dto_model.g.dart';

@JsonSerializable(createFactory: false)
class RegisterDtoModel extends RegisterDtoEntity {
  const RegisterDtoModel({
    required super.name,
    required super.email,
    required super.password,
    required super.phone,
  });

  Map<String, dynamic> toJson() => _$RegisterDtoModelToJson(this);
}
