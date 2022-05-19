import 'package:celering_user_app/features/search_view/domain/repositories/search_view_repository.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class SearchViewUserCase extends UseCase<List<PlaceModel>, String> {
  final SearchViewRepository searchViewRepository;

  SearchViewUserCase({required this.searchViewRepository});

  @override
  Future<Either<Failure, List<PlaceModel>>> call(String params) {
    return searchViewRepository.searchPlace(place: params);
  }
}
