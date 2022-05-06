import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:celering_user_app/core/model/server_response.dart';
import 'package:celering_user_app/core/services/center_api.dart';
import 'package:celering_user_app/core/errors/exceptions.dart';
import 'package:celering_user_app/core/services/server.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SearchViewDataSource {
  Future<List<PlaceModel>> searchPlace({required String place});
}

class SearchViewDataSourceImpl implements SearchViewDataSource {
  static late CenterApi centerApi;
  final SharedPreferences sharedPreferences;

  SearchViewDataSourceImpl({required this.sharedPreferences}) {
    String data = sharedPreferences.getString("token") ?? "";
    centerApi = CenterApi(token: data);
  }

  @override
  Future<List<PlaceModel>> searchPlace({required String place}) async {
    try {
      ServerResponse serverResponse = await centerApi.get(urlSpecific: Server.placeEndpoint(place));
      if (serverResponse.isSuccess) {
        final List listPlaceMap = serverResponse.result["items"];
        final List<PlaceModel> listPlaceModel = listPlaceMap.map((e) => PlaceModel.fromJson(e)).toList();
        return listPlaceModel;
      } else {
        throw SearchPlaceException(message: serverResponse.message ?? "");
      }
    } catch (e) {
      throw SearchPlaceException(message: "e.message!");
    }
  }
}
