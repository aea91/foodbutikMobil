import 'package:auth/register/domain/entity/register_response_entity.dart';
import 'package:auth/register/domain/repository/register_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

class UserRegisterUsecase extends UseCaseWithParams<RegisterResponseEntity, UserRegisterParams> {
  UserRegisterUsecase(this.repository);

  final RegisterRepository repository;

  @override
  ResultFuture<RegisterResponseEntity> call(UserRegisterParams params) async => repository.register(
      email: params.email, name: params.name, password: params.password, phone: params.phone);
}

class UserRegisterParams {
  const UserRegisterParams({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  final String email;
  final String name;
  final String password;
  final String phone;
}
