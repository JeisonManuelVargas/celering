import 'package:celering_user_app/core/errors/exceptions.dart';
import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/features/payment/data/datasources/save_card_future_payment_method_data_sources.dart';
import 'package:celering_user_app/features/payment/domain/repositories/save_card_future_payment_method_repository.dart';
import 'package:dartz/dartz.dart';

class SaveCardFuturePaymentMethodRepositoryImpl
    implements SaveCardFuturePaymentMethodRepository {
  final SaveCardFuturePaymentMethodDataSource
      saveCardFuturePaymentMethodDataSource;

  SaveCardFuturePaymentMethodRepositoryImpl(
      {required this.saveCardFuturePaymentMethodDataSource});

  @override
  Future<Either<Failure, dynamic>> saveCardFuturePaymentMethod() async {
    try {
      final result = await saveCardFuturePaymentMethodDataSource
          .saveCardFuturePaymentMethod();
      return Right(result);
    } on SaveCardFuturePaymentException catch (e) {
      return Left(SaveCardFuturePaymentFailure(message: e.message));
    }
  }
}
