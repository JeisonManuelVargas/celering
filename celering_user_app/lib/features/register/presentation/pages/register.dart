import 'package:celering_user_app/core/widget/title_celering.dart';
import 'package:celering_user_app/features/register/presentation/bloc/register_cubit.dart';
import 'package:celering_user_app/features/register/presentation/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:celering_user_app/core/widget/input_celering.dart';
import 'package:celering_user_app/core/widget/button_celering.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';

class Register extends BaseScreen<RegisterState, RegisterCubit> {
  final AmplifyAuthCognito auth = AmplifyAuthCognito();

  Register({
    Key? key,
  }) : super(key: key);

  @override
  RegisterCubit createBloc() => sl<RegisterCubit>()..load();

  @override
  Widget buildScreen(BuildContext context, RegisterCubit bloc, RegisterState state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: ScreenSize.width(context),
          height: ScreenSize.height(context),
          margin: EdgeInsets.symmetric(
            horizontal: ScreenSize.width(context) * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleCelering(title: "Register"),
              InputCelering(
                label: "Email",
                controller: state.emailController,
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.05,
              ),
              InputCelering(
                label: "Password",
                controller: state.passwordController,
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.05,
              ),
              ButtonCelering(
                label: "Register",
                isLoading: state.isLoading,
                onTap: () => bloc.signUp(
                  context: context,
                  loginState: state,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
