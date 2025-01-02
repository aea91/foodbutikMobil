import 'package:core/base/model/base_jwt_model.dart';
import 'package:core/cache/constants/cache_keys.dart';
import 'package:core/cache/shared/shared_manager.dart';
import 'package:core/navigation/go_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packages/jwt_decoder/jwt_decoder_manager.dart';
import 'package:welcome/splash/application/splash_state.dart';
import 'package:welcome/utils/navigation_constants.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial()) {
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    if (_checkToken()) {
      // User is logged in
      GoManager.instance.replace(path: NavigationConstants.dashboard);
    } else {
      // User is not logged in
      GoManager.instance.replace(path: NavigationConstants.login);
    }
  }

  bool _checkToken() {
    String? token = SharedManager.instance!.getStringValue(CacheKeys.token.name);
    if (token == null) return false;

    print("token: $token");

    BaseJwtModel jwt =
        JwtDecoderManager.instance.decode(token: token, fromJson: BaseJwtModel.fromJson);

    // if token is expired return false else return true
    return jwt.exp > DateTime.now().second;
  }
}
