import 'package:core/base/model/network_error.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:dashboard/data/datasource/dashboard_datasource.dart';
import 'package:dashboard/data/model/user_response_model.dart';
import 'package:dashboard/domain/repository/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  DashboardRepositoryImpl(this.dataSource);

  final DashboardDataSource dataSource;

  @override
  ResultFuture<List<UserResponseModel>> fetchUsers(
      {required String? query, required int? page, required int? limit}) async {
    try {
      final response = await dataSource.fetchUsers(
        query: query,
        page: page,
        limit: limit,
      );

      return Right(response);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
