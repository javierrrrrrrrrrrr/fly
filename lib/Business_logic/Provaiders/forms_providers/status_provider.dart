import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../Constants/contants.dart';
import '../../../DataLayer/Models/pay_fly_response_model.dart';

class StatusProvider extends ChangeNotifier {
  List<PayFlyModel> payResponseList = [];
  List<PayFlyModel> payAceptedResponseList = [];
  List<PayFlyModel> payPendingResponseList = [];
  List<PayFlyModel> payCancelResponseList = [];

  getInfoStatus(String token) async {
    var headers = {'Authorization': token};
    var request = http.Request('GET', Uri.parse('$kip/payments/getinvoices'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var respuesta = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final List<dynamic> decodedResp = json.decode(respuesta);

      decodedResp.map((item) {
        payResponseList.add(PayFlyModel.fromMap(item));
      }).toList();
      addStatusToList();

      //  print(payPendingResponseList.length);

      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  addStatusToList() {
    payAceptedResponseList.clear();
    payPendingResponseList.clear();
    payCancelResponseList.clear();
    for (var element in payResponseList) {
      if (element.status == "ACEPTED") {
        payAceptedResponseList.add(element);
      } else if (element.status == "PENDING") {
        payPendingResponseList.add(element);
      } else if (element.status == "REJECTED") {
        payCancelResponseList.add(element);
      }
    }
    notifyListeners();
  }
}
