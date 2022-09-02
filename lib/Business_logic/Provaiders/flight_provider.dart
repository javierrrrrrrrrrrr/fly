import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:http/http.dart' as http;

import '../../DataLayer/Models/flight_model.dart';

class FlightProvider extends ChangeNotifier {
  String token = '';

  List<Flight> flights = [];

  bool respuesta = false;

  Future<bool> getFlights() async {
    var request = http.Request('GET', Uri.parse('$ip/flights'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String respuesta = await response.stream.bytesToString();
      final List<dynamic> decodedResp = json.decode(respuesta);
      flights.clear();
      for (int i = 0; i < decodedResp.length; i++) {
        flights.add(Flight.fromMap(decodedResp[i]));
      }
      return true;
    } else {
      return false;
    }
  }

  Future<List<Flight>> getFlight() async {
    flights.clear();
    var response = await http.get(Uri.parse('$ip/flights'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedResp = json.decode(response.body);
      decodedResp.map((item) {
        flights.add(Flight.fromMap(item));
      }).toList();

      respuesta = true;
    }

    return flights;
  }
}
