class LatLngModel {
  LatLngModel({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory LatLngModel.fromJson(Map<String, dynamic> json) => LatLngModel(
        lat: json["lat"],
        lng: json["lng"],
      );

  factory LatLngModel.fromJsonNoData() => LatLngModel(
        lat: 0,
        lng: 0,
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
