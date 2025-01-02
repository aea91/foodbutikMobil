import 'package:auth/login/domain/entity/fcm_token_dto_entity.dart';
import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

class RegisterFcmTokenUsecase extends UseCaseWithParams<FcmTokenDtoEntity, RegisterFcmTokenParams> {
  final LoginRepository loginRepository;

  RegisterFcmTokenUsecase(this.loginRepository);

  @override
  ResultFuture<FcmTokenDtoEntity> call(RegisterFcmTokenParams params) async => loginRepository
      .registerFcmToken(token: params.token, userId: params.userId, platform: params.platform);
}

class RegisterFcmTokenParams {
  final String token;
  final int userId;
  final String platform;

  RegisterFcmTokenParams({required this.token, required this.userId, required this.platform});
}
