import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/features/travel/data/models/pickup_node.dart';
import 'package:dartz/dartz.dart';

abstract class TravelRepository {
  // TODO cambiar modelo pickupnode por travel model
  Future<Either<Failure, List<PickUpNode>>> getTravelList();
}
