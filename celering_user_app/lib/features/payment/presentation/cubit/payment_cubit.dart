import 'package:bloc/bloc.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/features/payment/domain/usecases/save_card_future_payment_method_use_case.dart';
import 'package:celering_user_app/features/payment/presentation/cubit/payment_state.dart';
import 'package:flutterlab_stripe/dependency_injection.dart' as stripe_sl;

class PaymentCubit extends Cubit<PaymentState> {
  final SaveCardFuturePaymentMethodUseCase saveCardFuturePaymentMethodUseCase;

  PaymentCubit({
    required this.saveCardFuturePaymentMethodUseCase,
  }) : super(PaymentState.initial());

  Future<void> load() async => emit(PaymentState.initial());

  Future<void> saveCardFuturePaymentMethod() async {
    NoParams noParams = NoParams();
    final response = await SaveCardFuturePaymentMethodUseCase(
            saveCardFuturePaymentMethodRepository: stripe_sl.sl())
        .call(noParams);
    // TODO revisar NoParams
    NoParams f = NoParams();
    final result = await saveCardFuturePaymentMethodUseCase(f);
    result.fold(
      (dynamic failure) {
        emit(
          state.copyWith(
            loading: false,
          ),
        );
      },
      (dynamic data) {
        emit(
          state.copyWith(
            loading: false,
          ),
        );
      },
    );
  }
}
