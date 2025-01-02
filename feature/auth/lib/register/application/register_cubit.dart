import 'package:auth/register/application/register_state.dart';
import 'package:auth/register/application/register_status.dart';
import 'package:auth/register/domain/usecase/user_register.dart';
import 'package:core/exception/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required UserRegisterUsecase userRegister})
      : _userRegister = userRegister,
        super(RegisterState.initial());

  final UserRegisterUsecase _userRegister;
  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: RegisterStatus.loading));
      final response = await _userRegister.call(UserRegisterParams(
          email: state.email!, name: state.name!, password: state.password!, phone: state.phone!));

      response.fold((error) {
        emit(state.copyWith(status: RegisterStatus.error, exception: error));
        reset();
      }, (result) {
        emit(state.copyWith(status: RegisterStatus.completed));
      });
    }
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setPhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void reset() {
    emit(RegisterState.initial());
  }

  void clearException() {
    emit(state.copyWith(exception: AppException(message: "")));
  }
}
