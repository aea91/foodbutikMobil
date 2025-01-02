import 'package:dashboard/data/model/user_response_model.dart';

abstract class DashboardDataSource {
  Future<List<UserResponseModel>> fetchUsers(
      {required String? query, required int? page, required int? limit});
}
