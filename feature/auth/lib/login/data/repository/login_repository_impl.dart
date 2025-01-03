import 'package:auth/login/data/datasource/login_datasource.dart';
import 'package:auth/login/data/model/fcm_token_dto_model.dart';
import 'package:auth/login/data/model/login_response_model.dart';
import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:core/base/model/network_error.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this.datasource);

  final LoginDatasource datasource;

  @override
  ResultFuture<void> deleteUser({required String userId}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> forgotPassword({required String email}) async {
    try {
      await datasource.forgotPassword(email: email);
      return Right(null);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }

  @override
  ResultFuture<LoginResponseModel> login({required String email, required String password}) async {
    try {
      final response = await datasource.login(email: email, password: password);
      return Right(response);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }

  @override
  ResultFuture<void> updateUser({String? userId, String? name, String? email, String? phone}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<FcmTokenDtoModel> registerFcmToken(
      {required String token, required int userId, required String platform}) async {
    try {
      final response =
          await datasource.registerFcmToken(token: token, userId: userId, platform: platform);
      return Right(response);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }

  @override
  ResultFuture<void> sendNotification(
      {required int userId, required String title, required String body}) async {
    try {
      await datasource.sendNotification(userId: userId, title: title, body: body);
      return Right(null);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
