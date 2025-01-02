import 'package:core/network/network_manager.dart';
import 'package:dashboard/application/dashboard_cubit.dart';
import 'package:dashboard/data/datasource/dashboard_datasource.dart';
import 'package:dashboard/data/datasource/dashboard_datasource_impl.dart';
import 'package:dashboard/data/repository/dashboard_repostory_impl.dart';
import 'package:dashboard/domain/repository/dashboard_repository.dart';
import 'package:dashboard/domain/usecase/user_get.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> getItDashboardInit() async {
  sl
    ..registerFactory(() => DashboardCubit(userGet: sl()))
    ..registerLazySingleton<UserGetUsecase>(() => UserGetUsecase(sl()))
    ..registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImpl(sl()))
    ..registerLazySingleton<DashboardDataSource>(
        () => DashboardDataSourceImpl(NetworkManager.instance!));
}
