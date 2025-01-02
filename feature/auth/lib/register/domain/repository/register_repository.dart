import 'package:auth/register/data/model/register_response_model.dart';
import 'package:core/typedef/network_typedef.dart';

abstract class RegisterRepository {
  ResultFuture<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}
