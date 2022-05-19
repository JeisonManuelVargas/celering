import 'package:celering_user_app/core/model/lat_lng_model.dart';
import 'package:here_sdk/mapview.dart';

class TravelOptionsState {
  LatLngModel myLatLng;
  List<LocationIndicator> myLocations;
  List<MapPolyline> mapPolylines;

  TravelOptionsState({
    required this.myLatLng,
    required this.myLocations,
    required this.mapPolylines,
  });

  factory TravelOptionsState.initial() => TravelOptionsState(
        myLatLng: LatLngModel.fromJsonNoData(),
        myLocations: [],
        mapPolylines: [],
      );

  TravelOptionsState copyWith({
    LatLngModel? myLatLng,
    List<LocationIndicator>? myLocations,
    List<MapPolyline>? mapPolylines,
  }) {
    return TravelOptionsState(
      myLatLng: myLatLng ?? this.myLatLng,
      myLocations: myLocations ?? this.myLocations,
      mapPolylines: mapPolylines ?? this.mapPolylines,
    );
  }
}
