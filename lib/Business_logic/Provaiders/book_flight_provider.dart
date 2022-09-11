import 'package:fly_cliente/DataLayer/Models/book_flight.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../Constants/contants.dart';

class BookFlightProvider extends ChangeNotifier {
  BookFlight? bookFlight;
  List<String> flightNumber = [];
  List<String> gate = [];
  List<String> destination = [];
  List<String> charter = [];

  Future<bool> refillFieldBookFlights() async {
    flightNumber.clear();
    gate.clear();
    destination.clear();
    charter.clear();
    var response = await http.get(Uri.parse('$ip/flights/getBookFlight'));
    print(response.body);
    if (response.statusCode == 200) {
      var respuesta = BookFlight.fromJson(response.body);

      bookFlight = respuesta;
      flightNumber.addAll(bookFlight!.flightNumber.map((e) => e.flightNumber));
      gate.addAll(bookFlight!.gate.map((e) => e.gate));

      destination.addAll(bookFlight!.destination.map((e) {
        List palabaras = e.from.split('-');
        return palabaras[1];
      }));

      charter.addAll(bookFlight!.charter.map((e) => e.charter));
      print(flightNumber);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}