// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/exception/app_exception.dart';
import 'package:dashboard/application/dashboard_status.dart';
import 'package:dashboard/domain/entity/user_response_entity.dart';
import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  const DashboardState({
    required this.status,
    required this.keyword,
    required this.exception,
    required this.users,
  });

  final DashboardStatus status;
  final String? keyword;
  final AppException? exception;
  final List<UserResponseEntity>? users;

  factory DashboardState.initial() => const DashboardState(
        status: DashboardStatus.initial,
        keyword: null,
        exception: null,
        users: null,
      );

  @override
  List<Object?> get props => [status, keyword, exception, users];

  DashboardState copyWith({
    DashboardStatus? status,
    String? keyword,
    AppException? exception,
    List<UserResponseEntity>? users,
  }) {
    return DashboardState(
      status: status ?? this.status,
      keyword: keyword ?? this.keyword,
      exception: exception ?? this.exception,
      users: users ?? this.users,
    );
  }
}
