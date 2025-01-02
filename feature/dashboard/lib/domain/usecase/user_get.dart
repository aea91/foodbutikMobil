import 'package:dashboard/domain/repository/dashboard_repository.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/model/user_response_model.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

part 'user_get.g.dart';

class UserGetUsecase extends UseCaseWithParams<List<UserResponseModel>, UserGetParams> {
  UserGetUsecase(this.repository);

  final DashboardRepository repository;

  @override
  ResultFuture<List<UserResponseModel>> call(UserGetParams params) async => repository.fetchUsers(
        query: params.query,
        page: params.page,
        limit: params.limit,
      );
}

@JsonSerializable(createFactory: false)
class UserGetParams {
  const UserGetParams({
    required this.query,
    required this.page,
    required this.limit,
  });

  final String? query;
  final int? page;
  final int? limit;

  Map<String, dynamic> toJson() => _$UserGetParamsToJson(this);
}
