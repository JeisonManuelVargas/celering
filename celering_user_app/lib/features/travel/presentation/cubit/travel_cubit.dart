import 'package:bloc/bloc.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/features/travel/domain/usecases/request_pick_up_node_usecase.dart';
import 'package:celering_user_app/features/travel/presentation/cubit/travel_state.dart';

class TravelCubit extends Cubit<TravelState> {
  final RequestPickupNodeUseCase requestPickupNodeUseCase;

  TravelCubit({required this.requestPickupNodeUseCase})
      : super(TravelState.initial());

  Future<void> load() async => emit(TravelState.initial());

  Future<void> requestPickUpNodes() async {
    final response = await requestPickupNodeUseCase(NoParams());
    response.fold(
      (left) => print('error'),
      (right) => print(right),
    );
  }
}
