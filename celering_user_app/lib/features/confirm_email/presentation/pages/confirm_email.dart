import 'package:celering_user_app/core/widget/title_celering.dart';
import 'package:flutter/material.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:celering_user_app/core/widget/input_celering.dart';
import 'package:celering_user_app/core/widget/button_celering.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/confirm_email/presentation/bloc/confirm_email_cubit.dart';
import 'package:celering_user_app/features/confirm_email/presentation/bloc/confirm_email_state.dart';

class ConfirmEmail extends BaseScreen<ConfirmEmailState, ConfirmEmailCubit> {
  final AmplifyAuthCognito auth = AmplifyAuthCognito();
  final String email;

  ConfirmEmail({Key? key, required this.email}) : super(key: key);

  @override
  ConfirmEmailCubit createBloc() => sl<ConfirmEmailCubit>()..load();

  @override
  Widget buildScreen(
      BuildContext context, ConfirmEmailCubit bloc, ConfirmEmailState state) {
    return Scaffold(
      body: Container(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),
        margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.width(context) * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleCelering(title: "Confirm Email"),
            InputCelering(
              label: "Codigo deverificacion",
              controller: state.confirmationCodeController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.05,
            ),
            Text(
              "enter the verification code that you receive in the mail",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.shade500,
                  fontSize: 12),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.05,
            ),
            ButtonCelering(
              label: "ConfirmEmail",
              onTap: () => bloc.confirmSignUp(
                context: context,
                email: email,
                confirmEmailState: state,
              ),
            )
          ],
        ),
      ),
    );
  }
}
