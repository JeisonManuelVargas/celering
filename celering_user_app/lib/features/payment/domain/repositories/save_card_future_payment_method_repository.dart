import 'package:celering_user_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SaveCardFuturePaymentMethodRepository {
  Future<Either<Failure, dynamic>> saveCardFuturePaymentMethod();
}
