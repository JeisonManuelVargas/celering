import 'package:bloc/bloc.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/features/travel_options/domain/usecases/reques_travel_options_use_case.dart';
import 'package:celering_user_app/features/travel_options/presentation/cubit/travel_options__state.dart';

class TravelOptionsCubit extends Cubit<TravelOptionsState> {
  final RequestTravelOptionsUseCase requestTravelOptionsUseCase;

  TravelOptionsCubit({required this.requestTravelOptionsUseCase})
      : super(TravelOptionsState.initial());

  Future<void> load() async => emit(TravelOptionsState.initial());

  Future<void> requestTravelOptions() async {
    final response = await requestTravelOptionsUseCase(NoParams());
    response.fold(
      (left) => print('error'),
      (right) => print(right),
    );
  }
}
