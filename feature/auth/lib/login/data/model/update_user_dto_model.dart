import 'package:auth/login/domain/entity/update_user_dto_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_dto_model.g.dart';

@JsonSerializable()
class UpdateUserDtoModel extends UpdateUserDtoEntity {
  const UpdateUserDtoModel({
    required super.name,
    required super.phone,
    required super.email,
    required super.password,
  });

  factory UpdateUserDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserDtoModelToJson(this);
}
