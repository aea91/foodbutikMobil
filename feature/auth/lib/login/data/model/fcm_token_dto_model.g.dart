// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenDtoModel _$FcmTokenDtoModelFromJson(Map<String, dynamic> json) =>
    FcmTokenDtoModel(
      token: json['token'] as String,
      userId: (json['userId'] as num).toInt(),
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$FcmTokenDtoModelToJson(FcmTokenDtoModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'platform': instance.platform,
    };
