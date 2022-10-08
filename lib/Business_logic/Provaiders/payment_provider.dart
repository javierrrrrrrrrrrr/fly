import 'dart:convert';

import 'package:fly_cliente/UI/Widgets/widgets.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:http/http.dart' as http;

import '../../Constants/contants.dart';
import '../../DataLayer/Models/pay_fly_response_model.dart';

class PaymentsProvider extends ChangeNotifier {
  PayFlyModel? payResponse;

  void pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-8X8MS1LfYbQgxpnPi652Pw');
    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardNonceRequestSuccess,
        onCardEntryCancel: _onCardEntryCancel);
  }

  void _onCardNonceRequestSuccess(CardDetails result) {
    print('Este es el nonce de la carta${result.nonce}');

    InAppPayments.completeCardEntry(onCardEntryComplete: _onCardEntryComplete);
  }

  void _onCardEntryCancel() {}

  void _onCardEntryComplete() {}

  Future<bool> verifyFlightInfo(
      String token, int flightOut, int flightIn, List<int> contacts) async {
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$kip/payments/createinvoice'));
    request.body = json.encode({
      "contacts": contacts,
      "flightOut": flightOut,
      "flightIn": flightIn,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var respuesta = await response.stream.bytesToString();
    if (response.statusCode == 202) {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      payResponse = PayFlyModel.fromMap(decodedResp);
      //print(payResponse!.fees.toString());

      print(payResponse!.fees.toString());
      print(payResponse!.flightOutRelation.boysPrice.toString());
      print(payResponse!.flightInRelation.flightNumber.toString());

      print("suuuiiiiiiiii");
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
