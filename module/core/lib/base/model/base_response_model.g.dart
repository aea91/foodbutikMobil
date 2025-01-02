// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    BaseResponseModel(
      data: json['data'],
      success: json['success'] as bool?,
      timeStamp: json['timeStamp'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'timeStamp': instance.timeStamp,
      'message': instance.message,
    };
