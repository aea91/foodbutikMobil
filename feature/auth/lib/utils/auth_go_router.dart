import 'package:auth/login/presentation/view/login_view.dart';
import 'package:auth/register/presentation/view/register_view.dart';
import 'package:auth/utils/navigation_constants.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> authGoRouter = [
  GoRoute(
    path: NavigationConstants.login,
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: NavigationConstants.register,
    builder: (context, state) => const RegisterView(),
  ),
];
