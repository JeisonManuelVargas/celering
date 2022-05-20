import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:celering_user_app/features/payment/presentation/cubit/payment_state.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab_stripe/flutterlab_stripe.dart';

class PaymentScreen extends BaseScreen<PaymentState, PaymentCubit> {
  const PaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  PaymentCubit createBloc() => sl<PaymentCubit>()..load();

  @override
  Widget buildScreen(
      BuildContext context, PaymentCubit bloc, PaymentState state) {
    return SetupFuturePaymentScreen();
  }
}
