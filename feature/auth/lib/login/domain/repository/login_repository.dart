import 'package:auth/login/data/model/fcm_token_dto_model.dart';
import 'package:auth/login/data/model/login_response_model.dart';
import 'package:core/typedef/network_typedef.dart';

abstract class LoginRepository {
  ResultFuture<LoginResponseModel> login({
    required String email,
    required String password,
  });

  ResultFuture<void> forgotPassword({
    required String email,
  });
  ResultFuture<void> updateUser({
    String? userId,
    String? name,
    String? email,
    String? phone,
  });
  ResultFuture<void> deleteUser({required String userId});
  ResultFuture<FcmTokenDtoModel> registerFcmToken({
    required String token,
    required int userId,
    required String platform,
  });
}
