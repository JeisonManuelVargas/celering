import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/features/travel_options/data/datasources/reques_travel_options_data_sources.dart';
import 'package:celering_user_app/features/travel_options/data/models/travel_option_model.dart';
import 'package:celering_user_app/features/travel_options/domain/repositories/reques_travel_options_repository.dart';
import 'package:dartz/dartz.dart';

class RequestTravelOptionsRepositoryImpl
    implements RequestTravelOptionsRepository {
  final RequestTravelOptionsDataSource requestTravelOptionsDataSource;

  RequestTravelOptionsRepositoryImpl(
      {required this.requestTravelOptionsDataSource});

  @override
  Future<Either<Failure, List<TravelOptionModel>>>
      requestTravelOptions() async {
    try {
      final result =
          await requestTravelOptionsDataSource.requestTravelOptions();
      return Right(result);
    } catch (e) {
      return Left(
        GetPlaceFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
