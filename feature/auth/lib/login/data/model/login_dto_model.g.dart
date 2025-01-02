// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDtoModel _$LoginDtoModelFromJson(Map<String, dynamic> json) =>
    LoginDtoModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginDtoModelToJson(LoginDtoModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
