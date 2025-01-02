import 'package:auth/register/data/datasource/register_datasource.dart';
import 'package:auth/register/data/model/register_dto_model.dart';
import 'package:auth/register/data/model/register_response_model.dart';
import 'package:auth/utils/network_constants.dart';
import 'package:core/base/model/network_error.dart';
import 'package:core/network/network_manager.dart';

class RegisterDatasourceImpl extends RegisterDatasource {
  RegisterDatasourceImpl(this.manager);

  final NetworkManager manager;

  @override
  Future<RegisterResponseModel> register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    final response = await manager.dioPost(
      path: NetworkConstants.registerPath,
      model: RegisterDtoModel(name: name, email: email, password: password, phone: phone),
      fromJson: RegisterResponseModel.fromJson,
    );

    if (response is NetworkException) {
      throw response;
    }

    return response;
  }
}
