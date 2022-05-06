import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:celering_user_app/navigator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:celering_user_app/core/util/snack_bar_message_celering.dart';
import 'package:celering_user_app/features/confirm_email/presentation/bloc/confirm_email_state.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  ConfirmEmailCubit() : super(ConfirmEmailState.initial());

  Future<void> load() async => emit(ConfirmEmailState.initial());

  Future<void> confirmSignUp({
    required ConfirmEmailState confirmEmailState,
    required BuildContext context,
    required String email,
  }) async {
    try {
      Amplify.Auth.confirmSignUp(
        confirmationCode: confirmEmailState.confirmationCodeController.text,
        username: email
      );
      AppNavigator.pushNamedAndRemoveUntil(Routes.HOME);
    } on AuthException catch (e) {
      snackBarMessageCelering(context, message: e.message);
    }
  }
}
