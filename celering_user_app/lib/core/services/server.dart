class Server {
  static const bool isDevEnvironment = true;

  static const String _apiDev = '';
  static const String _apiPrd = '';
  static const String _place = "https://discover.search.hereapi.com/";

  static const String _api = isDevEnvironment ? _apiDev : _apiPrd;

  // Endpoints
  static const String _login = '';
  static const String _placeURL = 'v1/geocode?q=';

  //key place
  static const String _placeKey = 'lC3ssccEacXTfKmT5bXHOZGr9qppGo61a630e6N9GLY';

  // Full url
  static String loginEndpoint(String path) => "$_api$_login$path";
  static String placeEndpoint(String path) => "$_place$_placeURL$path&apiKey=$_placeKey";
}
