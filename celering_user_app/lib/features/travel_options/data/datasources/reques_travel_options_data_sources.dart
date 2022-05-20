import 'package:celering_user_app/core/errors/travel_exception.dart';
import 'package:celering_user_app/core/model/server_response.dart';
import 'package:celering_user_app/core/services/center_api.dart';
import 'package:celering_user_app/features/travel_options/data/models/travel_option_model.dart';

abstract class RequestTravelOptionsDataSource {
  Future<List<TravelOptionModel>> requestTravelOptions();
}

class RequestTravelOptionsDataSourceImpl extends CenterApi
    implements RequestTravelOptionsDataSource {
  RequestTravelOptionsDataSourceImpl();

  @override
  Future<List<TravelOptionModel>> requestTravelOptions() async {
    try {
      Map<String, dynamic> requestBody = {
        "passenger_id": "3c07cc82-c349-4c86-a975-4a352151422a",
        "passenger_group_id": "8cf4bf38-797c-41e7-852c-9b04539a5c19",
        "origin_location_id": "HERE-345678",
        "destination_location_id": "HERE-054234",
        "travel_datetime_type": "PICKUP",
        "travel_datetime": "2022-05-09T12:10:54Z",
        "number_pax": 4,
        "number_pmr_pax": 1,
        "d2d": false,
        "default_selection": false
      };
      ServerResponse serverResponse = await post(
        data: requestBody,
        //TODO Ajustar url de la api
        urlSpecific: 'http://54.73.244.185/bookings/searcher/v1/travel-options',
      );

      print(serverResponse.result);

      List<TravelOptionModel> traveOptionsList = [];

      return traveOptionsList;
    } catch (e) {
      throw TravelException(message: "e.message!");
    }
  }
}
