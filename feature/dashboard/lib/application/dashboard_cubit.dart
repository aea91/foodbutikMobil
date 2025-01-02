import 'package:dashboard/application/dashboard_state.dart';
import 'package:dashboard/application/dashboard_status.dart';
import 'package:dashboard/domain/entity/user_response_entity.dart';
import 'package:dashboard/domain/usecase/user_get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required UserGetUsecase userGet})
      : _userGet = userGet,
        super(DashboardState.initial());

  static const _pageSize = 10;

  final UserGetUsecase _userGet;
  final PagingController<int, UserResponseEntity> pagingController =
      PagingController(firstPageKey: 0);

  Future<void> init() async {
    await fetchUsers(pageKey: 0);
    pagingController.addPageRequestListener((pageKey) {
      fetchUsers(pageKey: pageKey);
    });
  }

  Future<void> fetchUsers({required int pageKey}) async {
    bool? isLastPage;
    emit(state.copyWith(status: DashboardStatus.loading));
    final result = await _userGet.call(UserGetParams(
      query: state.keyword,
      page: pagingController.nextPageKey,
      limit: _pageSize,
    ));
    result.fold((failure) {
      emit(state.copyWith(status: DashboardStatus.error, exception: failure));
    }, (users) {
      final List<UserResponseEntity> userList = users;
      emit(state.copyWith(users: userList, status: DashboardStatus.success));
      isLastPage = userList.length < _pageSize;
    });
    if (isLastPage ?? false) {
      pagingController.appendLastPage(state.users as List<UserResponseEntity>);
    } else {
      final nextPage = pageKey + 1;
      pagingController.appendPage(state.users as List<UserResponseEntity>, nextPage);
    }
  }

  Future<void> searchUsers({required String search, required int pageKey}) async {
    bool? isLastPage;

    if (pageKey == 0) {
      pagingController.itemList = [];
    }
    emit(state.copyWith(status: DashboardStatus.loading));
    final result = await _userGet.call(UserGetParams(
      query: search,
      page: pageKey,
      limit: _pageSize,
    ));
    result.fold((failure) {
      emit(state.copyWith(status: DashboardStatus.error, exception: failure));
    }, (users) {
      final List<UserResponseEntity> userList = users;
      emit(state.copyWith(users: userList, status: DashboardStatus.success));
      isLastPage = userList.length < _pageSize;
    });
    if (isLastPage ?? false) {
      pagingController.appendLastPage(state.users as List<UserResponseEntity>);
    } else {
      final nextPage = pageKey + 1;
      pagingController.appendPage(state.users as List<UserResponseEntity>, nextPage);
    }
  }

  void setKeyword(String keyword) {
    emit(state.copyWith(keyword: keyword, users: null));
  }
}
