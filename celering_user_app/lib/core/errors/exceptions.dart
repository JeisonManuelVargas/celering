class SearchPlaceException implements Exception {
  final String message;

  SearchPlaceException({required this.message});
}

class SaveCardFuturePaymentException implements Exception {
  final String message;

  SaveCardFuturePaymentException({required this.message});
}

class InitializeStripeException implements Exception {
  final String message;

  InitializeStripeException({required this.message});
}
