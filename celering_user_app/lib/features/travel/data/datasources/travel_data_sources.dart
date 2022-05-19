import 'package:celering_user_app/core/errors/travel_exception.dart';
import 'package:celering_user_app/core/model/server_response.dart';
import 'package:celering_user_app/core/services/center_api.dart';
import 'package:celering_user_app/features/travel/data/models/pickup_node.dart';

abstract class TravelDataSource {
  Future<List<PickUpNode>> requestPickUpNodes();
}

class TravelDataSourceImpl implements TravelDataSource {
  static late CenterApi centerApi;

  TravelDataSourceImpl() {
    centerApi = CenterApi();
  }

  @override
  Future<List<PickUpNode>> requestPickUpNodes() async {
    try {
      Map<String, dynamic> requestData = {
        "passenger_id": "3c07cc82-c349-4c86-a975-4a352151422a",
        "passenger_group_id": "8cf4bf38-797c-41e7-852c-9b04539a5c19",
        "origin_location_id": "HERE-345678",
        "destination_location_id": "HERE-054234",
        "travel_datetime_type": "PICKUP",
        "travel_datetime": {},
        "number_pax": 4,
        "number_pmr_pax": 1,
        "d2d": false,
        "default_selection": false,
      };
      ServerResponse serverResponse = await centerApi.post(
        data: requestData,
        //TODO Agregar url de la api
        urlSpecific: '',
      );

      List<PickUpNode> pickUpNodesList = [];

      return pickUpNodesList;
    } catch (e) {
      throw TravelException(message: "e.message!");
    }
  }
}
