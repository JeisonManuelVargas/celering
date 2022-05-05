import 'package:flutter/cupertino.dart';

class RegisterState {
  final bool isRegister;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  RegisterState({
    required this.isRegister,
    required this.emailController,
    required this.passwordController,
  });

  factory RegisterState.initial() => RegisterState(
        isRegister: false,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  RegisterState copyWith({
    bool? isRegister,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return RegisterState(
        isRegister: isRegister ?? this.isRegister,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.emailController);
  }
}
