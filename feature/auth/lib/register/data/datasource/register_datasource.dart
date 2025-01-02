import 'package:auth/register/data/model/register_response_model.dart';

abstract class RegisterDatasource {
  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}
