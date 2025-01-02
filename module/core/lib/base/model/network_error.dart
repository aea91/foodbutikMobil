import 'package:core/exception/app_exception.dart';

class NetworkException extends AppException {
  const NetworkException({super.message, super.showMessage});

  const NetworkException.fromException(NetworkException exception) : this();
}
