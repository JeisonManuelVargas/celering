import 'package:celering_user_app/features/travel_options/data/models/travel_option_model.dart';

class TravelOptionsState {
  bool isLoading;
  List<TravelOptionModel> travelOptions;

  TravelOptionsState({
    required this.isLoading,
    required this.travelOptions,
  });

  factory TravelOptionsState.initial() => TravelOptionsState(
        isLoading: false,
        travelOptions: [],
      );

  TravelOptionsState copyWith({
    bool? isLoading,
    List<TravelOptionModel>? travelOptions,
  }) {
    return TravelOptionsState(
      isLoading: isLoading ?? this.isLoading,
      travelOptions: travelOptions ?? this.travelOptions,
    );
  }
}
