import 'package:auth/login/domain/repository/login_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_send.g.dart';

class NotificationSendUsecase extends UseCaseWithParams<void, NotificationSendParams> {
  final LoginRepository _loginRepository;

  NotificationSendUsecase(this._loginRepository);

  @override
  ResultFuture<void> call(NotificationSendParams params) async => _loginRepository.sendNotification(
      userId: params.userId, title: params.title, body: params.body);
}

@JsonSerializable(createFactory: false)
class NotificationSendParams {
  final int userId;
  final String title;
  final String body;

  NotificationSendParams(this.userId, this.title, this.body);

  Map<String, dynamic> toJson() => _$NotificationSendParamsToJson(this);
}
