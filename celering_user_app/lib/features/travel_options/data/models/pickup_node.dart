class PickUpNode {
  String id;
  String name;
  double latitude;
  double longitude;
  String description;

  PickUpNode(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.description});

  factory PickUpNode.fromJsonData(Map<String, dynamic> json) => PickUpNode(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
      );

  factory PickUpNode.fromJsonNoData() => PickUpNode(
        id: "",
        name: "",
        latitude: 0,
        longitude: 0,
        description: "",
      );
}
