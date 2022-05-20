class TravelOptionModel {
  String id;
  int order;
  Map<String, dynamic> pickupNode;
  Map<String, dynamic> dropoffNode;
  DateTime dropoffTime;
  double price;
  // String name;
  // double latitude;
  // double longitude;
  // String description;

  TravelOptionModel({
    required this.id,
    required this.order,
    required this.pickupNode,
    required this.dropoffNode,
    required this.dropoffTime,
    required this.price,
  });

  factory TravelOptionModel.fromJsonData(Map<String, dynamic> json) =>
      TravelOptionModel(
        id: json["id"],
        order: json["order"],
        pickupNode: json["pickupNode"],
        dropoffNode: json["dropoffNode"],
        dropoffTime: json["dropoffTime"],
        price: json["price"],
      );

  factory TravelOptionModel.fromJsonNoData() => TravelOptionModel(
        id: "",
        order: 0,
        pickupNode: {},
        dropoffNode: {},
        dropoffTime: DateTime.now(),
        price: 0,
      );
}
