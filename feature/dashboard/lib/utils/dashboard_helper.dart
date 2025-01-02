import 'package:core/cache/constants/cache_keys.dart';
import 'package:core/cache/shared/shared_manager.dart';

class DashboardHelper {
  static String? getToken() {
    return SharedManager.instance!.getStringValue(CacheKeys.token.name);
  }
}
