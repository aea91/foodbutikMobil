import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

class UserUpdateUsecase extends UseCaseWithParams<void, UserUpdateParams> {
  UserUpdateUsecase(this.repository);

  final LoginRepository repository;

  @override
  ResultFuture<void> call(UserUpdateParams params) async =>
      repository.updateUser(name: params.name, email: params.email, phone: params.phone);
}

class UserUpdateParams {
  const UserUpdateParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  final String name;
  final String email;
  final String password;
  final String phone;
}
