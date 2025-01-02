// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtTokenModel _$JwtTokenModelFromJson(Map<String, dynamic> json) => JwtTokenModel(
      CompanyId: json['CompanyId'] as String?,
      EMail: json['EMail'] as String?,
      HotelId: json['HotelId'] as String?,
      NameSurname: json['NameSurname'] as String?,
      PhoneNumber: json['PhoneNumber'] as String?,
      UserId: json['UserId'] as String?,
      role: json['role'] as String?,
      HotelCompanyEmployeeId: json['HotelCompanyEmployeeId'] as String?,
    );

Map<String, dynamic> _$JwtTokenModelToJson(JwtTokenModel instance) => <String, dynamic>{
      'UserId': instance.UserId,
      'NameSurname': instance.NameSurname,
      'PhoneNumber': instance.PhoneNumber,
      'CompanyId': instance.CompanyId,
      'EMail': instance.EMail,
      'HotelId': instance.HotelId,
      'role': instance.role,
      'HotelCompanyEmployeeId': instance.HotelCompanyEmployeeId,
    };
