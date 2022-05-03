import 'package:celering_user_app/features/search_view/data/models/place_model.dart';

class SearchViewState {
  bool loading;
  bool isSuccess;
  String message;
  List<PlaceModel> places;

  SearchViewState({
    required this.loading,
    required this.places,
    required this.message,
    required this.isSuccess,
  });

  factory SearchViewState.initial() => SearchViewState(
        places: [],
        loading: false,
        message: "",
        isSuccess: true,
      );

  SearchViewState copyWith({
    bool? loading,
    bool? isSuccess,
    String? message,
    List<PlaceModel>? places,
  }) {
    return SearchViewState(
        places: places ?? this.places,
        message: message ?? this.message,
        loading: loading ?? this.loading,
        isSuccess: isSuccess ?? this.isSuccess);
  }
}
