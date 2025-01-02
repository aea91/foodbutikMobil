import 'package:core/cache/shared/shared_manager.dart';
import 'package:core/logger/contact_logger.dart';
import 'package:core/navigation/go_manager.dart';
import 'package:core/network/network_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:mycontacts/env/app_env.dart';
import 'package:mycontacts/product/go_routes.dart';

final sl = GetIt.instance;

Future<void> mainInit() async {
  await SharedManager.instance!.init();
  GoManager.instance.init(router);
  ContactLogger.instance!.init(isCacheLog: true, logDuration: Duration(seconds: 10));
  NetworkManager.instance!.init(
    baseUrl: AppEnv().baseUrl,
    sendTimeOut: 30,
    connectTimeOut: 30,
    receiveTimeOut: 30,
  );
}
