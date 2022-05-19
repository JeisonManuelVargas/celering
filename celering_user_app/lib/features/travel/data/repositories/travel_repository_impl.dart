import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/features/travel/data/datasources/travel_data_sources.dart';
import 'package:celering_user_app/features/travel/data/models/pickup_node.dart';
import 'package:celering_user_app/features/travel/domain/repositories/travel_repository.dart';
import 'package:dartz/dartz.dart';

class TravelRepositoryImpl implements TravelRepository {
  final TravelDataSource travelDataSource;

  TravelRepositoryImpl({required this.travelDataSource});

  @override
  // TODO cambiar modelo pickupnode por travel model
  Future<Either<Failure, List<PickUpNode>>> getTravelList() async {
    try {
      final result = await travelDataSource.requestPickUpNodes();
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
