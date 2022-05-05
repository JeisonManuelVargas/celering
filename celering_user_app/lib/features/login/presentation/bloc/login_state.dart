import 'package:flutter/cupertino.dart';

class LoginState {
  final bool isLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginState({
    required this.isLogin,
    required this.emailController,
    required this.passwordController,
  });

  factory LoginState.initial() => LoginState(
        isLogin: false,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  LoginState copyWith({
    bool? isLogin,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return LoginState(
        isLogin: isLogin ?? this.isLogin,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.emailController);
  }
}
