import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

class ForgotPasswordUsecase extends UseCaseWithParams<void, ForgotPasswordUsecaseParams> {
  ForgotPasswordUsecase(this.repository);

  final LoginRepository repository;

  @override
  ResultFuture<void> call(ForgotPasswordUsecaseParams params) async =>
      repository.forgotPassword(email: params.email);
}

class ForgotPasswordUsecaseParams {
  const ForgotPasswordUsecaseParams({
    required this.email,
  });

  final String email;
}
