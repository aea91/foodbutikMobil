// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FcmTokenDtoEntity extends Equatable {
  final String token;
  final int userId;
  final String platform;

  const FcmTokenDtoEntity({required this.token, required this.userId, required this.platform});

  @override
  List<Object?> get props => [token, userId, platform];

  FcmTokenDtoEntity copyWith({
    String? token,
    int? userId,
    String? platform,
  }) {
    return FcmTokenDtoEntity(
      token: token ?? this.token,
      userId: userId ?? this.userId,
      platform: platform ?? this.platform,
    );
  }
}
