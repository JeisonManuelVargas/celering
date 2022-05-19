import 'package:celering_user_app/features/payment/data/models/payment_card_data_model.dart';

class PaymentState {
  bool loading;
  PaymentCardDataModel paymentCardData;

  PaymentState({required this.loading, required this.paymentCardData});

  factory PaymentState.initial() => PaymentState(
        loading: false,
        paymentCardData: PaymentCardDataModel.fromJsonNoData(),
      );

  PaymentState copyWith({
    bool? loading,
    PaymentCardDataModel? paymentCardData,
  }) {
    return PaymentState(
      loading: loading ?? this.loading,
      paymentCardData: paymentCardData ?? this.paymentCardData,
    );
  }
}
