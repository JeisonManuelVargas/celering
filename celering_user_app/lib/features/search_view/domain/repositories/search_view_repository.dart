import 'package:dartz/dartz.dart';
import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';

abstract class SearchViewRepository {
  Future<Either<Failure, List<PlaceModel>>> searchPlace({required String place});
}
