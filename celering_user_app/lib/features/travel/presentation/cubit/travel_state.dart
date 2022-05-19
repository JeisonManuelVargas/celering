import 'package:celering_user_app/core/model/lat_lng_model.dart';
import 'package:here_sdk/mapview.dart';

class TravelState {
  LatLngModel myLatLng;
  List<LocationIndicator> myLocations;
  List<MapPolyline> mapPolylines;

  TravelState({
    required this.myLatLng,
    required this.myLocations,
    required this.mapPolylines,
  });

  factory TravelState.initial() => TravelState(
        myLatLng: LatLngModel.fromJsonNoData(),
        myLocations: [],
        mapPolylines: [],
      );

  TravelState copyWith({
    LatLngModel? myLatLng,
    List<LocationIndicator>? myLocations,
    List<MapPolyline>? mapPolylines,
  }) {
    return TravelState(
      myLatLng: myLatLng ?? this.myLatLng,
      myLocations: myLocations ?? this.myLocations,
      mapPolylines: mapPolylines ?? this.mapPolylines,
    );
  }
}
