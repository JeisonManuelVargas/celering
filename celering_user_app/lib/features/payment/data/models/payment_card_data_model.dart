class PaymentCardDataModel {
  String cardNumber;
  String cardHolder;
  String expiryDate;
  String cvv;

  PaymentCardDataModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cvv,
  });

  factory PaymentCardDataModel.fromJson(Map<String, dynamic> json) =>
      PaymentCardDataModel(
        cardNumber: json["cardNumber"],
        cardHolder: json["cardHolder"],
        expiryDate: json["expiryDate"],
        cvv: json["cvv"],
      );

  factory PaymentCardDataModel.fromJsonNoData() => PaymentCardDataModel(
        cardNumber: "",
        cardHolder: "",
        expiryDate: "",
        cvv: "",
      );

  Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "cardHolder": cardHolder,
        "expiryDate": expiryDate,
        "cvv": cvv,
      };
}
