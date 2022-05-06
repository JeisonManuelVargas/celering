import 'package:celering_user_app/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:celering_user_app/core/util/snack_bar_message_celering.dart';
import 'package:celering_user_app/features/login/presentation/bloc/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  Future<void> load() async => emit(LoginState.initial());

  Future<void> signIn({
    required LoginState loginState,
    required BuildContext context,
  }) async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      snackBarMessageCelering(context, message: e.message);
    }

    try {
      SignInResult data = await Amplify.Auth.signIn(
        username: loginState.emailController.text.trim(),
        password: loginState.passwordController.text.trim(),
      );
      print(data);
      AppNavigator.pushNamedAndRemoveUntil(Routes.HOME);
    } on AuthException catch (e) {
      snackBarMessageCelering(context, message: e.message);
    }
  }
}
