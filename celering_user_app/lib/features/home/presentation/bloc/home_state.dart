import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/routing.dart';
import 'package:celering_user_app/core/model/lat_lng_model.dart';

class HomeState {
  LatLngModel myLatLng;
  LatLngModel arrivalPoint;
  PlaceModel placeSelected;
  RoutingEngine routingEngine;
  List<MapPolyline> mapPolyLines;
  List<LocationIndicator> myLocations;

  HomeState({
    required this.myLatLng,
    required this.myLocations,
    required this.mapPolyLines,
    required this.arrivalPoint,
    required this.placeSelected,
    required this.routingEngine,
  });

  factory HomeState.initial() => HomeState(
        myLocations: [],
        mapPolyLines: [],
        routingEngine: RoutingEngine(),
        myLatLng: LatLngModel.fromJsonNoData(),
        placeSelected: PlaceModel.fromJsonNoData(),
        arrivalPoint: LatLngModel.fromJsonNoData(),
      );

  HomeState copyWith({
    LatLngModel? myLatLng,
    LatLngModel? arrivalPoint,
    PlaceModel? placeSelected,
    List<MapPolyline>? mapPolyLines,
    List<LocationIndicator>? myLocations,
  }) {
    return HomeState(
      routingEngine: routingEngine,
      myLatLng: myLatLng ?? this.myLatLng,
      myLocations: myLocations ?? this.myLocations,
      mapPolyLines: mapPolyLines ?? this.mapPolyLines,
      arrivalPoint: arrivalPoint ?? this.arrivalPoint,
      placeSelected: placeSelected ?? this.placeSelected,
    );
  }
}
