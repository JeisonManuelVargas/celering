// @dart=2.9
import 'package:flutterlab_stripe/flutterlab_stripe.dart';
import 'package:here_sdk/core.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:celering_user_app/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SdkContext.init(IsolateOrigin.main);
  await FlutterLabStripe().configFlutterLabStripe(
      apiPublishKey:
          "pk_test_51KwqlMHfRbkGPJ9yQ0bqO2ZY9s1OJvSaz7jUM3yqXfz4DvcbQuKqVRByTNeIvWSH81rx3NUnl84Eoeua8vGh7Fwy00ummwVJDY",
      apiSecretKey:
          "sk_test_51KwqlMHfRbkGPJ9yEvYcgf2isopzXsd8ZaBIizfhaSSol0x9uVRnw5mMOCpIs1oRfZRDmquFylq9Bus7hWnJyOUA00v0APs6qh",
      merchantIdentifier: "",
      urlScheme: "");
  await di.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Celering User',
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.generateRoute,
    );
  }
}
