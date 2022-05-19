class ServerResponse {
  bool isSuccess;
  dynamic result;
  String? message;

  ServerResponse({
    this.message,
    this.result,
    required this.isSuccess,
  });

  dynamic get response {
    return result;
  }
}