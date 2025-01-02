import 'package:auth/login/data/datasource/login_datasource.dart';
import 'package:auth/login/data/model/fcm_token_dto_model.dart';
import 'package:auth/login/data/model/forgot_password_dto_model.dart';
import 'package:auth/login/data/model/login_dto_model.dart';
import 'package:auth/login/data/model/login_response_model.dart';
import 'package:auth/utils/network_constants.dart';
import 'package:core/base/model/network_error.dart';
import 'package:core/global/global_helper.dart';
import 'package:core/network/network_manager.dart';

class LoginDatasourceImpl extends LoginDatasource {
  LoginDatasourceImpl(this.manager);

  final NetworkManager manager;

  @override
  Future<void> deleteUser({required String userId}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    final response = await manager.dioPost(
      path: NetworkConstants.forgotPasswordPath,
      model: ForgotPasswordDtoModel(email: email),
      fromJson: null,
    );
    if (response is NetworkException) {
      throw response;
    }
    return response;
  }

  @override
  Future<LoginResponseModel> login({required String email, required String password}) async {
    final response = await manager.dioPost(
      path: NetworkConstants.loginPath,
      model: LoginDtoModel(email: email, password: password),
      fromJson: LoginResponseModel.fromJson,
    );

    if (response is NetworkException) {
      throw response;
    }
    return response;
  }

  @override
  Future<void> updateUser({String? userId, String? name, String? email, String? phone}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<FcmTokenDtoModel> registerFcmToken(
      {required String token, required int userId, required String platform}) async {
    final response = await manager.dioPost(
      path: NetworkConstants.registerFcmTokenPath,
      model: FcmTokenDtoModel(token: token, userId: userId, platform: platform),
      fromJson: FcmTokenDtoModel.fromJson,
      token: GlobalHelper.getToken(),
    );
    if (response is NetworkException) {
      throw response;
    }
    return response;
  }
}
