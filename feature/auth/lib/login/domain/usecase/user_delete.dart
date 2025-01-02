import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

class UserDeleteUsecase extends UseCaseWithParams<void, UserDeleteParams> {
  UserDeleteUsecase(this.repository);

  final LoginRepository repository;

  @override
  ResultFuture<void> call(UserDeleteParams params) async =>
      repository.deleteUser(userId: params.id);
}

class UserDeleteParams {
  const UserDeleteParams({
    required this.id,
  });

  final String id;
}
