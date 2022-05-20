import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/core/widget/button_celering.dart';
import 'package:celering_user_app/features/travel_options/presentation/cubit/travel_options_cubit.dart';
import 'package:celering_user_app/features/travel_options/presentation/cubit/travel_options__state.dart';
import 'package:celering_user_app/injection_container.dart';

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
      body: SizedBox(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: ScreenSize.height(context) * 0.1,
            ),
            ButtonCelering(
              label: "Get travel options",
              isLoading: state.isLoading,
              onTap: () => bloc.requestTravelOptionsUseCase(NoParams()),
            ),
          ],
        ),
      ),
    );
  }
}
