import 'dart:convert';

import '../../UI/Widgets/widgets.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:http/http.dart' as http;

import '../../Constants/contants.dart';
import '../../DataLayer/Models/flight_model.dart';
import '../../DataLayer/Models/pay_fly_response_model.dart';

class PaymentsProvider extends ChangeNotifier {
  bool ispagocompletado = false;
  PayFlyModel? payResponse;
  String nonce = '';
  String token = '';

  changeValuePay(bool value) {
    ispagocompletado = value;
    notifyListeners();
  }

  void pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-8X8MS1LfYbQgxpnPi652Pw');
    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardNonceRequestSuccess,
        onCardEntryCancel: _onCardEntryCancel);
  }

  void _onCardNonceRequestSuccess(CardDetails result) async {
    nonce = result.nonce;
    makepayment(token, payResponse!.id);

    notifyListeners();
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

      // print(payResponse!.fees.toString());
      // print(payResponse!.flightOutRelation.boysPrice.toString());
      // print(payResponse!.flightInRelation.flightNumber.toString());

      //  print("suuuiiiiiiiii");
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> makepayment(
    String token,
    int idbooking,
  ) async {
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$kip/payments/makepayment'));
    request.body = json.encode({"nonce": nonce, "idBooking": idbooking});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Flight convertflightInRelationtoFlight(PayFlyModel payResponse) {
    Flight departureFlight = Flight(
        id: payResponse.flightInRelation.id,
        date: payResponse.flightInRelation.date,
        day: payResponse.flightInRelation.day,
        charter: payResponse.flightInRelation.charter,
        flightNumber: payResponse.flightInRelation.flightNumber,
        from: payResponse.flightInRelation.from,
        to: payResponse.flightInRelation.to,
        checkIn: payResponse.flightInRelation.checkIn,
        departure: payResponse.flightInRelation.departure,
        arrival: payResponse.flightInRelation.arrival,
        gate: payResponse.flightInRelation.gate,
        reservedSeats: payResponse.flightInRelation.reservedSeats,
        openSeats: payResponse.flightInRelation.openSeats,
        status: payResponse.flightInRelation.status,
        adultPrice: payResponse.flightInRelation.adultPrice,
        childPrice: payResponse.flightInRelation.childPrice,
        boysPrice: payResponse.flightInRelation.boysPrice,
        createdAt: payResponse.flightInRelation.createdAt,
        isDeleted: payResponse.flightInRelation.isDeleted);

    // departureFlight = Flight.fromMap(departureFlight.toMap());
    return departureFlight;
  }

  Flight convertflightOutRelationtoFlight() {
    Flight returnFlight = Flight(
        id: payResponse!.flightOutRelation.id,
        date: payResponse!.flightOutRelation.date,
        day: payResponse!.flightOutRelation.day,
        charter: payResponse!.flightOutRelation.charter,
        flightNumber: payResponse!.flightOutRelation.flightNumber,
        from: payResponse!.flightOutRelation.from,
        to: payResponse!.flightOutRelation.to,
        checkIn: payResponse!.flightOutRelation.checkIn,
        departure: payResponse!.flightOutRelation.departure,
        arrival: payResponse!.flightOutRelation.arrival,
        gate: payResponse!.flightOutRelation.gate,
        reservedSeats: payResponse!.flightOutRelation.reservedSeats,
        openSeats: payResponse!.flightOutRelation.openSeats,
        status: payResponse!.flightOutRelation.status,
        adultPrice: payResponse!.flightOutRelation.adultPrice,
        childPrice: payResponse!.flightOutRelation.childPrice,
        boysPrice: payResponse!.flightOutRelation.boysPrice,
        createdAt: payResponse!.flightOutRelation.createdAt,
        isDeleted: payResponse!.flightOutRelation.isDeleted);

    return returnFlight;
  }
}
