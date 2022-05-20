import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/features/travel_options/data/models/travel_option_model.dart';
import 'package:dartz/dartz.dart';

abstract class RequestTravelOptionsRepository {
  Future<Either<Failure, List<TravelOptionModel>>> requestTravelOptions();
}
