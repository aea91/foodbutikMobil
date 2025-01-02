import 'package:auth/login/data/model/fcm_token_dto_model.dart';
import 'package:auth/login/data/model/login_response_model.dart';

abstract class LoginDatasource {
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });

  Future<void> forgotPassword({
    required String email,
  });
  Future<void> updateUser({
    String? userId,
    String? name,
    String? email,
    String? phone,
  });

  Future<void> deleteUser({required String userId});

  Future<FcmTokenDtoModel> registerFcmToken({
    required String token,
    required int userId,
    required String platform,
  });
}
