import 'package:core/base/model/network_error.dart';
import 'package:core/network/interface_network_manager.dart';
import 'package:dashboard/data/datasource/dashboard_datasource.dart';
import 'package:dashboard/data/model/user_response_model.dart';
import 'package:dashboard/domain/usecase/user_get.dart';
import 'package:dashboard/utils/dashboard_helper.dart';
import 'package:dashboard/utils/network_constants.dart';

class DashboardDataSourceImpl extends DashboardDataSource {
  DashboardDataSourceImpl(this.manager);

  final InterfaceNetworkManager manager;

  @override
  Future<List<UserResponseModel>> fetchUsers(
      {required String? query, required int? page, required int? limit}) async {
    print("query: $query, page: $page, limit: $limit");
    final response = await manager.dioGet(
      path: NetworkConstants.fetchUsers,
      fromJson: UserResponseModel.fromJson,
      token: DashboardHelper.getToken(),
      queryParam: UserGetParams(query: query, page: page, limit: limit).toJson(),
    );

    if (response is NetworkException) {
      throw response;
    }

    return List<UserResponseModel>.from(response);
  }
}
