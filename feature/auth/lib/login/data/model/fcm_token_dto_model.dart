import 'package:auth/login/domain/entity/fcm_token_dto_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fcm_token_dto_model.g.dart';

@JsonSerializable()
class FcmTokenDtoModel extends FcmTokenDtoEntity {
  const FcmTokenDtoModel({
    required super.token,
    required super.userId,
    required super.platform,
  });

  factory FcmTokenDtoModel.fromJson(Map<String, dynamic> json) => _$FcmTokenDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$FcmTokenDtoModelToJson(this);
}
