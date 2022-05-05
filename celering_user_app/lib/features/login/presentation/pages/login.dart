import 'package:flutter/material.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:celering_user_app/core/widget/input_celering.dart';
import 'package:celering_user_app/core/widget/button_celering.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/login/presentation/bloc/login_cubit.dart';
import 'package:celering_user_app/features/login/presentation/bloc/login_state.dart';

class Login extends BaseScreen<LoginState, LoginCubit> {
  final AmplifyAuthCognito auth = AmplifyAuthCognito();

  Login({
    Key? key,
  }) : super(key: key);

  @override
  LoginCubit createBloc() => sl<LoginCubit>()..load();

  @override
  Widget buildScreen(BuildContext context, LoginCubit bloc, LoginState state) {
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
            InputCelering(
              label: "Email",
              controller: state.emailController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.05,
            ),
            InputCelering(
              label: "Password",
              controller: state.emailController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.05,
            ),
            ButtonCelering(
              label: "Login",
              onTap: () => bloc.signIn(
                context: context,
                loginState: state,
              ),
            )
          ],
        ),
      ),
    );
  }
}
