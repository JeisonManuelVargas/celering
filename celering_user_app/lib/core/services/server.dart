import 'package:celering_user_app/core/key/global_keys.dart';

class Server {
  static const bool isDevEnvironment = true;

  static const String _apiDev = '';
  static const String _apiPrd = '';
  static const String _place = "https://discover.search.hereapi.com/";

  static const String _api = isDevEnvironment ? _apiDev : _apiPrd;

  // Endpoints
  static const String _login = '';
  static const String _placeURL = 'v1/geocode?q=';

  // Full url
  static String loginEndpoint(String path) => "$_api$_login$path";
  static String placeEndpoint(String path) => "$_place$_placeURL$path&apiKey=${GlobalKeys.placeKey}";
}
