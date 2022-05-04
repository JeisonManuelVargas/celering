import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:celering_user_app/features/search_view/presentation/bloc/search_view_state.dart';
import 'package:celering_user_app/features/search_view/domain/use_cases/search_view_use_case.dart';

class SearchViewCubit extends Cubit<SearchViewState> {
  final SearchViewUserCase searchViewUserCase;

  SearchViewCubit({
    required this.searchViewUserCase,
  }) : super(SearchViewState.initial());

  Future<void> load() async => emit(SearchViewState.initial());

  Future<void> searchPlace({required String place}) async {
    emit(state.copyWith(loading: true));
    final resultDb = await searchViewUserCase(place);
    resultDb.fold(
      (dynamic failure) {
        emit(
          state.copyWith(
            loading: false,
            isSuccess: false,
            message: failure.message,
          ),
        );
      },
      (List<PlaceModel> places) {
        emit(
          state.copyWith(
            isSuccess: true,
            places: places,
            loading: false,
          ),
        );
      },
    );
  }
}
