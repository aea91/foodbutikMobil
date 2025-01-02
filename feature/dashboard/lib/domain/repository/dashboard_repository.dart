import 'package:core/typedef/network_typedef.dart';
import 'package:dashboard/data/model/user_response_model.dart';

abstract class DashboardRepository {
  ResultFuture<List<UserResponseModel>> fetchUsers(
      {required String? query, required int? page, required int? limit});
}
