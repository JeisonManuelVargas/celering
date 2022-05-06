import 'package:celering_user_app/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:celering_user_app/core/util/snack_bar_message_celering.dart';
import 'package:celering_user_app/features/register/presentation/bloc/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  Future<void> load() async => emit(RegisterState.initial());

  Future<void> signUp({
    required RegisterState loginState,
    required BuildContext context,
  }) async {
    try {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.email: loginState.emailController.text,
      };

      await Amplify.Auth.signUp(
        password: loginState.passwordController.text,
        username: loginState.emailController.text,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );

      AppNavigator.push(
        Routes.CONFIRMATION_EMAIL,
        loginState.emailController.text,
      );
    } on AuthException catch (e) {
      snackBarMessageCelering(context, message: e.message);
    }
  }
}
