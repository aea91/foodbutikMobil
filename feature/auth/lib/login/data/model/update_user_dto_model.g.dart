// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDtoModel _$UpdateUserDtoModelFromJson(Map<String, dynamic> json) =>
    UpdateUserDtoModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UpdateUserDtoModelToJson(UpdateUserDtoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
    };
