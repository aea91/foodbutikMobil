import 'package:auth/register/application/register_cubit.dart';
import 'package:auth/register/application/register_state.dart';
import 'package:auth/utils/injection_contatiner.dart';
import 'package:auth/utils/navigation_constants.dart';
import 'package:core/base/view/base_view.dart';
import 'package:core/extensions/context_extensions.dart';
import 'package:core/extensions/string_extensions.dart';
import 'package:core/navigation/go_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/snackbar/base_snackbar.dart';

part 'register_subview.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.exception?.message != null && state.exception!.message!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                BaseSnackbar.snackBar(context, state.exception?.message ?? "error", onVisible: () {
              context.read<RegisterCubit>().clearException();
            }));
          }
        },
        builder: (context, state) {
          return BaseView(
              appBar: AppBar(
                  title: Text(
                "Register",
                style: context.textTheme.titleLarge!.copyWith(color: context.theme.primaryColor),
              )),
              body: Padding(
                padding: context.paddingPage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        key: context.read<RegisterCubit>().formKey,
                        child: Column(
                          children: [
                            _Name(),
                            SizedBox(height: 20),
                            _Email(),
                            SizedBox(height: 20),
                            _Password(),
                            SizedBox(height: 20),
                            _Phone(),
                            SizedBox(height: 20),
                            _RegisterButton(),
                            SizedBox(height: 20),
                            _LoginTextButton(),
                          ],
                        ))
                  ],
                ),
              ));
        },
      ),
    );
  }
}
