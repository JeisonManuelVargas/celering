import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/features/travel/data/models/pickup_node.dart';
import 'package:celering_user_app/features/travel/domain/repositories/travel_repository.dart';
import 'package:dartz/dartz.dart';

class RequestPickupNodeUseCase extends UseCase<List<PickUpNode>, NoParams> {
  final TravelRepository repository;

  RequestPickupNodeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PickUpNode>>> call(params) async {
    return await repository.getTravelList();
  }
}
