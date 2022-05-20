import 'package:celering_user_app/core/errors/failure.dart';
import 'package:celering_user_app/core/usecases/use_cases.dart';
import 'package:celering_user_app/features/travel_options/data/models/travel_option_model.dart';
import 'package:celering_user_app/features/travel_options/domain/repositories/reques_travel_options_repository.dart';
import 'package:dartz/dartz.dart';

class RequestTravelOptionsUseCase
    extends UseCase<List<TravelOptionModel>, NoParams> {
  final RequestTravelOptionsRepository repository;

  RequestTravelOptionsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<TravelOptionModel>>> call(params) async {
    return await repository.requestTravelOptions();
  }
}
