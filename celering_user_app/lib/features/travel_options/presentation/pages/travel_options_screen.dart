import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/travel_options/presentation/cubit/travel_options_cubit.dart';
import 'package:celering_user_app/features/travel_options/presentation/cubit/travel_options__state.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

class TravelOptionsScreen
    extends BaseScreen<TravelOptionsState, TravelOptionsCubit> {
  const TravelOptionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  TravelOptionsCubit createBloc() => sl<TravelOptionsCubit>()..load();

  @override
  Widget buildScreen(
      BuildContext context, TravelOptionsCubit bloc, TravelOptionsState state) {
    return Scaffold(
      body: Stack(
        children: [
          HereMap(
            // onMapCreated: (HereMapController hereMapController) =>
            //     _onMapCreated(
            //   bloc: bloc,
            //   hereMapController: hereMapController,
            // ),
            onMapCreated: _onMapCreated,
          ),
          // Test button
          Positioned(
              top: 0,
              left: 0,
              child: ElevatedButton(
                onPressed: () => bloc.requestTravelOptions(),
                child: const Icon(Icons.search),
              ))
        ],
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError? error) {
      if (error != null) {
        debugPrint('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(52.530932, 13.384915), distanceToEarthInMeters);
    });
  }
}
