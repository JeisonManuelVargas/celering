import 'package:dartz/dartz.dart';
import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/core/errors/exceptions.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:celering_user_app/features/search_view/data/data_sources/search_view_data_sources.dart';
import 'package:celering_user_app/features/search_view/domain/repositories/search_view_repository.dart';

class SearchViewRepositoryImpl implements SearchViewRepository {
  final SearchViewDataSource searchViewDataSource;

  SearchViewRepositoryImpl({required this.searchViewDataSource});

  @override
  Future<Either<Failure, List<PlaceModel>>> searchPlace({
    required String place,
  }) async {
    try {
      final result = await searchViewDataSource.searchPlace(
        place: place,
      );
      return Right(result);
    } on SearchPlaceException catch (e) {
      return Left(SearchPlaceFailure(message: e.message));
    }
  }
}
