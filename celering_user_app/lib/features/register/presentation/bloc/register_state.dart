import 'package:flutter/cupertino.dart';

class RegisterState {
  final bool isLoading;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  RegisterState({
    required this.isLoading,
    required this.emailController,
    required this.passwordController,
  });

  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  RegisterState copyWith({
    bool? isLoading,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return RegisterState(
        isLoading: isLoading ?? this.isLoading,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.emailController);
  }
}
