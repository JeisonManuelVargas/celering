import 'package:here_sdk/core.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';
import 'package:celering_user_app/navigator.dart';
import 'package:location/location.dart' as geolocator;
import 'package:celering_user_app/injection_container.dart';
import 'package:celering_user_app/core/model/lat_lng_model.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/home/presentation/widgets/button.dart';
import 'package:celering_user_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:celering_user_app/features/home/presentation/bloc/home_state.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';

class Home extends BaseScreen<HomeState, HomeCubit> {
  final PlaceModel placeSelected;
  static late HereMapController _hereMapController;
  static late List<LocationIndicator> _myLocations;
  final geolocator.Location location = geolocator.Location();

  Home({
    Key? key,
    required this.placeSelected,
  }) : super(key: key);

  @override
  HomeCubit createBloc() => sl<HomeCubit>()..load();

  @override
  Widget buildScreen(BuildContext context, HomeCubit bloc, HomeState state) {
    _myLocations = state.myLocations;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          HereMap(
            onMapCreated: (HereMapController hereMapController) =>
                _onMapCreated(bloc, hereMapController),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                handledButton: () => handledAddPolyLine(
                    bloc: bloc,
                    destinationLatLng: LatLngModel(
                      lat: placeSelected.position.lat,
                      lng: placeSelected.position.lng,
                    ),
                    startLatLng: LatLngModel(
                      lat: state.myLatLng.lat,
                      lng: state.myLatLng.lng,
                    )),
                icon: Icons.place_outlined,
              ),
              CustomButton(
                handledButton: () => handledSearchButton(bloc, state),
                icon: Icons.search,
              ),
              CustomButton(
                handledButton: () => handledClearMap(bloc, state),
                icon: Icons.close,
              ),
            ],
          )
        ],
      ),
    );
  }

  handledAddPolyLine({
    required HomeCubit bloc,
    required LatLngModel startLatLng,
    required LatLngModel destinationLatLng,
  }) {
    if (destinationLatLng.lat != 0) {
      bloc.addRoute(
        hereMapController: _hereMapController,
        startGeoCoordinates: GeoCoordinates(
          startLatLng.lat,
          startLatLng.lng,
        ),
        destinationGeoCoordinates: GeoCoordinates(
          destinationLatLng.lat,
          destinationLatLng.lng,
        ),
      );
    }
  }

  handledClearMap(HomeCubit bloc, HomeState state) => bloc.clearMapPolyline(
        hereMapController: _hereMapController,
        mapPolyLines: state.mapPolyLines,
      );

  void _onMapCreated(
    HomeCubit bloc,
    HereMapController hereMapController,
  ) {
    _hereMapController = hereMapController;
    location.onLocationChanged.listen(
      (geolocator.LocationData cLoc) {
        bloc.listenMyPosition(
          cLoc: cLoc,
          myLocations: _myLocations,
          hereMapController: _hereMapController,
        );
      },
    );

    _hereMapController.mapScene.loadSceneForMapScheme(
      MapScheme.normalDay,
      (MapError? error) {
        if (error != null) {
          print("Map scene not loaded. MapError: " + error.toString());
        }
        GeoCoordinates geolocation = GeoCoordinates(1.858934, -76.057269);
        _hereMapController.camera.lookAtPointWithDistance(geolocation, 10000);
      },
    );
  }

  handledSearchButton(HomeCubit bloc, HomeState state) {
    location.onLocationChanged;
    AppNavigator.push(Routes.SEARCH);
  }
}
