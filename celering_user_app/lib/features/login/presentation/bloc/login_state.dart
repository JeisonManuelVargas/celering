import 'package:flutter/cupertino.dart';

class LoginState {
  final bool isLoading;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginState({
    required this.isLoading,
    required this.emailController,
    required this.passwordController,
  });

  factory LoginState.initial() => LoginState(
        isLoading: false,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  LoginState copyWith({
    bool? isLoading,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.emailController);
  }
}
