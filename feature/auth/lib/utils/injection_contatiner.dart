import 'package:auth/login/application/login_cubit.dart';
import 'package:auth/login/data/datasource/login_datasource.dart';
import 'package:auth/login/data/datasource/login_datasource_impl.dart';
import 'package:auth/login/data/repository/login_repository_impl.dart';
import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:auth/login/domain/usecase/forgot_password_usecase.dart';
import 'package:auth/login/domain/usecase/notification_send.dart';
import 'package:auth/login/domain/usecase/register_fcm_token_usecase.dart';
import 'package:auth/login/domain/usecase/user_login.dart';
import 'package:auth/register/application/register_cubit.dart';
import 'package:auth/register/data/datasource/register_datasource.dart';
import 'package:auth/register/data/datasource/register_datasource_impl.dart';
import 'package:auth/register/data/repository/register_repository_impl.dart';
import 'package:auth/register/domain/repository/register_repository.dart';
import 'package:auth/register/domain/usecase/user_register.dart';
import 'package:core/network/network_manager.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> getItAuthInit() async {
  sl
    ..registerFactory(() => LoginCubit(
          userLoginUseCase: sl(),
          forgotPasswordUsecase: sl(),
          registerFcmTokenUsecase: sl(),
          registerUserUsecase: sl(),
          notificationSendUsecase: sl(),
        ))
    ..registerLazySingleton<UserLoginUsecase>(() => UserLoginUsecase(sl()))
    ..registerLazySingleton<ForgotPasswordUsecase>(() => ForgotPasswordUsecase(sl()))
    ..registerLazySingleton<RegisterFcmTokenUsecase>(() => RegisterFcmTokenUsecase(sl()))
    ..registerLazySingleton<NotificationSendUsecase>(() => NotificationSendUsecase(sl()))
    ..registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()))
    ..registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl(NetworkManager.instance!));

  sl
    ..registerFactory(() => RegisterCubit(userRegister: sl()))
    ..registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl()))
    ..registerLazySingleton<RegisterDatasource>(
        () => RegisterDatasourceImpl(NetworkManager.instance!))
    ..registerLazySingleton<UserRegisterUsecase>(() => UserRegisterUsecase(sl()));
}
