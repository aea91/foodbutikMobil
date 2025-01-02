import 'package:auth/login/domain/entity/login_response_entity.dart';
import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

class UserLoginUsecase extends UseCaseWithParams<LoginResponseEntity, UserLoginParams> {
  UserLoginUsecase(this.repository);

  final LoginRepository repository;

  @override
  ResultFuture<LoginResponseEntity> call(UserLoginParams params) async =>
      repository.login(email: params.email, password: params.password);
}

class UserLoginParams {
  const UserLoginParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
