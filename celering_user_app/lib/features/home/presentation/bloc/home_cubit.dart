import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:here_sdk/routing.dart' as here;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart' as geolocator;
import 'package:celering_user_app/core/model/lat_lng_model.dart';
import 'package:celering_user_app/features/home/presentation/bloc/home_state.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> load() async => emit(HomeState.initial());

  Future<void> listenMyPosition({
    required HomeState homeState,
    required geolocator.LocationData cLoc,
    required HereMapController hereMapController,
  }) async {
    if (homeState.myLocations.isNotEmpty) {
      clearMapMyPosition(
        myLocations: homeState.myLocations,
        hereMapController: hereMapController,
      );
    }
    LocationIndicator locationIndicator = LocationIndicator();
    locationIndicator.locationIndicatorStyle =
        LocationIndicatorIndicatorStyle.pedestrian;

    GeoCoordinates geoCoordinates = GeoCoordinates(
      cLoc.latitude!,
      cLoc.longitude!,
    );
    Location location = Location.withCoordinates(geoCoordinates);
    location.time = DateTime.now();
    location.bearingInDegrees = cLoc.verticalAccuracy;

    locationIndicator.updateLocation(location);
    hereMapController.addLifecycleListener(locationIndicator);
    emit(
      state.copyWith(
        myLocations: [locationIndicator],
        myLatLng: LatLngModel(
          lat: cLoc.latitude!,
          lng: cLoc.longitude!,
        ),
      ),
    );

    if (homeState.mapPolyLines.isNotEmpty) {
      addRoute(
        mapPolyLines: homeState.mapPolyLines,
        hereMapController: hereMapController,
        destinationGeoCoordinates: GeoCoordinates(
          homeState.placeSelected.position.lat,
          homeState.placeSelected.position.lng,
        ),
        startGeoCoordinates: GeoCoordinates(
          cLoc.latitude!,
          cLoc.longitude!,
        ),
      );
    }
  }

  Future<void> clearMapPolyline({
    required List<MapPolyline> mapPolyLines,
    required HereMapController hereMapController,
  }) async {
    for (var mapPolyline in mapPolyLines) {
      hereMapController.mapScene.removeMapPolyline(mapPolyline);
    }
    emit(state.copyWith(mapPolyLines: []));
  }

  Future<void> clearMapMyPosition({
    required List<LocationIndicator> myLocations,
    required HereMapController hereMapController,
  }) async {
    for (var locationIndicator in myLocations) {
      hereMapController.removeLifecycleListener(locationIndicator);
      emit(state.copyWith(myLocations: []));
    }
  }

  Future<void> addRoute({
    required List<MapPolyline> mapPolyLines,
    required GeoCoordinates startGeoCoordinates,
    required HereMapController hereMapController,
    required GeoCoordinates destinationGeoCoordinates,
  }) async {
    var startWaypoint = Waypoint.withDefaults(startGeoCoordinates);
    var destinationWaypoint = Waypoint.withDefaults(destinationGeoCoordinates);

    List<Waypoint> waypoints = [startWaypoint, destinationWaypoint];

    state.routingEngine.calculateCarRoute(
      waypoints,
      CarOptions.withDefaults(),
      (
        RoutingError? routingError,
        List<here.Route>? routeList,
      ) {
        if (routingError == null) {
          here.Route route = routeList!.first;
          _showRouteOnMap(route, hereMapController);
        }
      },
    );
    if (mapPolyLines.isNotEmpty) {
      clearMapPolyline(
        mapPolyLines: mapPolyLines,
        hereMapController: hereMapController,
      );
    }
  }

  _showRouteOnMap(
    here.Route route,
    HereMapController hereMapController,
  ) {
    GeoPolyline routeGeoPolyline = route.geometry;
    double widthInPixels = 20;
    MapPolyline routeMapPolyline = MapPolyline(
      routeGeoPolyline,
      widthInPixels,
      const Color.fromARGB(160, 0, 144, 138),
    );
    hereMapController.mapScene.addMapPolyline(routeMapPolyline);
    emit(state.copyWith(mapPolyLines: [routeMapPolyline]));
  }

  setPlaceSelect(PlaceModel placeSelected) {
    emit(state.copyWith(placeSelected: placeSelected));
  }
}
