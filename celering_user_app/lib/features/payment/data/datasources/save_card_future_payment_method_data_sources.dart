import 'package:celering_user_app/core/services/center_api.dart';
import 'package:flutterlab_stripe/flutterlab_stripe.dart';

abstract class SaveCardFuturePaymentMethodDataSource {
  Future<dynamic> saveCardFuturePaymentMethod();
}

class SaveCardFuturePaymentMethodDataSourceImpl extends CenterApi
    implements SaveCardFuturePaymentMethodDataSource {
  SaveCardFuturePaymentMethodDataSourceImpl();

  @override
  Future<dynamic> saveCardFuturePaymentMethod() async {
    try {} catch (e) {}
  }
}
