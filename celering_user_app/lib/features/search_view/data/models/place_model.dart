class PlaceModel {
  PlaceModel({
    required this.title,
    required this.id,
    required this.resultType,
    required this.localityType,
    required this.address,
    required this.position,
    required this.mapView,
  });

  String title;
  String id;
  String resultType;
  String localityType;
  Address address;
  Position position;
  MapView mapView;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"]??"",
        title: json["title"]??"",
        resultType: json["resultType"]??"",
        localityType: json["localityType"]??"",
        address: json["address"] != null ? Address.fromJson(json["address"]) : Address.fromJsonNoData(),
        mapView: json["mapView"] != null ? MapView.fromJson(json["mapView"]) : MapView.fromJsonNoData(),
        position: json["position"] != null ? Position.fromJson(json["position"]) : Position.fromJsonNoData(),
      );

  factory PlaceModel.fromJsonNoData() => PlaceModel(
        id: "",
        title: "",
        resultType: "",
        localityType: "",
        address: Address.fromJsonNoData(),
        mapView: MapView.fromJsonNoData(),
        position: Position.fromJsonNoData(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "resultType": resultType,
        "localityType": localityType,
        "address": address.toJson(),
        "position": position.toJson(),
        "mapView": mapView.toJson(),
      };
}

class Address {
  Address({
    required this.label,
    required this.countryCode,
    required this.countryName,
    required this.countyCode,
    required this.county,
    required this.city,
    required this.postalCode,
  });

  String label;
  String countryCode;
  String countryName;
  String countyCode;
  String county;
  String city;
  String postalCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        label: json["label"],
        countryCode: json["countryCode"],
        countryName: json["countryName"],
        countyCode: json["countyCode"],
        county: json["county"],
        city: json["city"],
        postalCode: json["postalCode"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "countryCode": countryCode,
        "countryName": countryName,
        "countyCode": countyCode,
        "county": county,
        "city": city,
        "postalCode": postalCode,
      };

  factory Address.fromJsonNoData() => Address(
    city: "",
    label: "",
    county: "",
    countyCode: "",
    postalCode: "",
    countryCode: "",
    countryName: "",
  );
}

class MapView {
  MapView({
    required this.west,
    required this.south,
    required this.east,
    required this.north,
  });

  double west;
  double south;
  double east;
  double north;

  factory MapView.fromJson(Map<String, dynamic> json) => MapView(
        west: json["west"].toDouble(),
        south: json["south"].toDouble(),
        east: json["east"].toDouble(),
        north: json["north"].toDouble(),
      );

  factory MapView.fromJsonNoData() => MapView(
        west: 0,
        east: 0,
        south: 0,
        north: 0,
      );

  Map<String, dynamic> toJson() => {
        "west": west,
        "south": south,
        "east": east,
        "north": north,
      };
}

class Position {
  Position({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );


  factory Position.fromJsonNoData() => Position(
        lat: 0,
        lng: 0,
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class FieldScore {
  FieldScore({
    required this.county,
    required this.city,
  });

  int county;
  int city;

  factory FieldScore.fromJson(Map<String, dynamic> json) => FieldScore(
        county: json["county"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "county": county,
        "city": city,
      };
}
