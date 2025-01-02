// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_jwt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseJwtModel _$BaseJwtModelFromJson(Map<String, dynamic> json) => BaseJwtModel(
      userId: (json['userId'] as num).toInt(),
      iat: (json['iat'] as num).toInt(),
      exp: (json['exp'] as num).toInt(),
    );

Map<String, dynamic> _$BaseJwtModelToJson(BaseJwtModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'iat': instance.iat,
      'exp': instance.exp,
    };
