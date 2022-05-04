import 'package:here_sdk/core.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';
import 'package:location/location.dart' as geolocator;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:celering_user_app/core/model/lat_lng_model.dart';
import 'package:celering_user_app/core/widget/sliding_panel.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/home/presentation/widgets/button.dart';
import 'package:celering_user_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:celering_user_app/features/home/presentation/bloc/home_state.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:celering_user_app/features/search_view/presentation/pages/search_view.dart';

class Home extends BaseScreen<HomeState, HomeCubit> {
  static late HomeState _globalState;
  static late HereMapController _hereMapController;
  final geolocator.Location location = geolocator.Location();
  static late final PanelController _panelController = PanelController();

  Home({
    Key? key,
  }) : super(key: key);

  @override
  HomeCubit createBloc() => sl<HomeCubit>()..load();

  @override
  Widget buildScreen(BuildContext context, HomeCubit bloc, HomeState state) {
    _globalState = state;
    return Scaffold(
      body: SlidingPanel(
        controller: _panelController,
        panelBuilder: (sc) => SearchView(
          scrollController: sc,
          onTapPlace: (PlaceModel placeModel) => handledSearchButton(
            bloc,
            placeModel,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            HereMap(
              onMapCreated: (HereMapController hereMapController) =>
                  _onMapCreated(
                bloc: bloc,
                hereMapController: hereMapController,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  handledButton: () => handledAddPolyLine(
                    bloc: bloc,
                    state: state,
                    destinationLatLng: LatLngModel(
                      lat: state.placeSelected.position.lat,
                      lng: state.placeSelected.position.lng,
                    ),
                    startLatLng: LatLngModel(
                      lat: state.myLatLng.lat,
                      lng: state.myLatLng.lng,
                    ),
                  ),
                  icon: Icons.place_outlined,
                ),
                CustomButton(
                  handledButton: () => _panelController.open(),
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
      ),
    );
  }

  handledAddPolyLine({
    required HomeCubit bloc,
    required HomeState state,
    required LatLngModel startLatLng,
    required LatLngModel destinationLatLng,
  }) {
    if (destinationLatLng.lat != 0) {
      bloc.addRoute(
        mapPolyLines: state.mapPolyLines,
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
        mapPolyLines: state.mapPolyLines,
        hereMapController: _hereMapController,
      );

  void _onMapCreated({
    required HomeCubit bloc,
    required HereMapController hereMapController,
  }) {
    _hereMapController = hereMapController;
    location.onLocationChanged.listen(
      (geolocator.LocationData cLoc) {
        bloc.listenMyPosition(
          cLoc: cLoc,
          homeState: _globalState,
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

  handledSearchButton(HomeCubit bloc, PlaceModel placeSelected) {
    bloc.setPlaceSelect(placeSelected);
    _panelController.close();
  }
}
