import 'package:json_annotation/json_annotation.dart';
part 'jwt_token_model.g.dart';

@JsonSerializable()
class JwtTokenModel {
  const JwtTokenModel({
    required this.CompanyId,
    required this.EMail,
    required this.HotelId,
    required this.NameSurname,
    required this.PhoneNumber,
    required this.UserId,
    required this.role,
    required this.HotelCompanyEmployeeId,
  });

  final String? UserId;
  final String? NameSurname;
  final String? PhoneNumber;
  final String? CompanyId;
  final String? EMail;
  final String? HotelId;
  final String? role;
  final String? HotelCompanyEmployeeId;

  factory JwtTokenModel.fromJson(Map<String, dynamic> json) => _$JwtTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$JwtTokenModelToJson(this);
}
