import 'package:auth/login/application/login_cubit.dart';
import 'package:auth/login/application/login_state.dart';
import 'package:auth/login/application/login_status.dart';
import 'package:auth/utils/injection_contatiner.dart';
import 'package:auth/utils/navigation_constants.dart';
import 'package:core/base/view/base_view.dart';
import 'package:core/extensions/context_extensions.dart';
import 'package:core/extensions/string_extensions.dart';
import 'package:core/navigation/go_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:uikit/snackbar/base_snackbar.dart';
part 'login_subview.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.exception?.message != null && state.exception!.message!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(BaseSnackbar.snackBar(
                  context, state.exception?.message ?? "error", onVisible: () {
                context.read<LoginCubit>().clearException();
              }));
            }
          },
          builder: (context, state) {
            return BaseView(
                appBar: AppBar(
                    title: Text(
                  "Login",
                  style: context.textTheme.titleLarge!.copyWith(color: context.theme.primaryColor),
                )),
                body: Padding(
                  padding: context.paddingPage,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                          key: context.read<LoginCubit>().formKey,
                          child: Column(
                            children: [
                              _Email(),
                              SizedBox(height: 40),
                              _Password(),
                              SizedBox(height: 40),
                            ],
                          )),
                      SizedBox(height: 20),
                      state.status == LoginStatus.loading
                          ? Center(child: CircularProgressIndicator.adaptive())
                          : _LoginButton(),
                      SizedBox(height: 20),
                      _RegisterTextButton(),
                      SignInButton(Buttons.google,
                          onPressed: () => context.read<LoginCubit>().signInWithGoogle())
                    ],
                  ),
                ));
          },
        ));
  }
}
