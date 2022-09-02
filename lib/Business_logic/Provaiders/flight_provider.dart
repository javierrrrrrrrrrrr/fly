import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:http/http.dart' as http;

import '../../DataLayer/Models/flight_model.dart';

class FlightProvider extends ChangeNotifier {
  String token = '';

  List<Flight> flights = [];

  Future<String> getFlights() async {
    var request = http.Request('GET', Uri.parse('$ip/flights'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String respuesta = await response.stream.bytesToString();
    } else {
      print(response.reasonPhrase);
    }

    return "";
  }
}
