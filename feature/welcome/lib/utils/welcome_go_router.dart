import 'package:auth/login/presentation/view/login_view.dart';
import 'package:dashboard/presentation/view/dashboard_view.dart';
import 'package:go_router/go_router.dart';
import 'package:welcome/splash/presentation/splash_view.dart';
import 'package:welcome/utils/navigation_constants.dart';

List<GoRoute> welcoeGoRouter = [
  GoRoute(
    path: NavigationConstants.splash,
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: NavigationConstants.login,
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: NavigationConstants.dashboard,
    builder: (context, state) => const DashboardView(),
  ),
];
