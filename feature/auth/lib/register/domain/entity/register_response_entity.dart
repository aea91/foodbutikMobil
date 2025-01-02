import 'package:auth/login/domain/entity/login_response_entity.dart';

class RegisterResponseEntity extends LoginResponseEntity {
  const RegisterResponseEntity({
    required super.userId,
    required super.token,
  });
}
