import 'package:json_annotation/json_annotation.dart';
part 'base_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseResponseModel {
  BaseResponseModel({
    this.data,
    this.success,
    this.timeStamp,
    this.message,
  });

  dynamic data;
  bool? success;
  String? timeStamp;
  String? message;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BaseResponseModelToJson(this);
  }
}
