import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchPlaceFailure extends Failure {
  final String message;

  SearchPlaceFailure({required this.message});
}

class GetPlaceFailure extends Failure {
  final String message;

  GetPlaceFailure({required this.message});
}

class SaveCardFuturePaymentFailure extends Failure {
  final String message;

  SaveCardFuturePaymentFailure({required this.message});
}

class InitializeStripeFailure extends Failure {
  final String message;

  InitializeStripeFailure({required this.message});
}
