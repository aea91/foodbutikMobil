import 'package:auth/register/data/datasource/register_datasource.dart';
import 'package:auth/register/data/model/register_response_model.dart';
import 'package:auth/register/domain/repository/register_repository.dart';
import 'package:core/base/model/network_error.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:fpdart/fpdart.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  RegisterRepositoryImpl(this._datasource);
  final RegisterDatasource _datasource;

  @override
  ResultFuture<RegisterResponseModel> register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    try {
      final response =
          await _datasource.register(name: name, email: email, password: password, phone: phone);
      return Right(response);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
