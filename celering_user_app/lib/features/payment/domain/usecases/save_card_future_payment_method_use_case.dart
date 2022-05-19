import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/features/payment/domain/repositories/save_card_future_payment_method_repository.dart';
import 'package:dartz/dartz.dart';

class SaveCardFuturePaymentMethodUseCase extends UseCase<dynamic, NoParams> {
  final SaveCardFuturePaymentMethodRepository
      saveCardFuturePaymentMethodRepository;

  SaveCardFuturePaymentMethodUseCase(
      {required this.saveCardFuturePaymentMethodRepository});

  @override
  // TODO revisar el NoParams
  Future<Either<Failure, dynamic>> call(_) {
    return saveCardFuturePaymentMethodRepository.saveCardFuturePaymentMethod();
  }
}
