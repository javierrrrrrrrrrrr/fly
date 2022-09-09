import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/Constants/day_in_week.dart';
import 'package:http/http.dart' as http;

import '../../DataLayer/Models/flight_model.dart';

class FlightProvider extends ChangeNotifier {
  String token = '';
  Map<String, dynamic> body = {};

  /// campos del filtro */
  String flightNumber = "";
  String dateFrom = '';
  String dateTo = '';
  String selectedCharter = '';
  String selectedRouteFrom = '';
  String selectedRouteTo = '';
  String selectedWeekDay = '';
  String selectedGate = '';
  bool selectedStatus = false;

  bool isSelectedDay = false;

  changeValorselectedStatus(bool valor) {
    selectedStatus = valor;
    notifyListeners();
  }

  bool _isexpandedDropDown = false;
  bool get isepandedDropDown => _isexpandedDropDown;
  set isepandedDropDown(bool value) {
    _isexpandedDropDown = value;
    notifyListeners();
  }

  List<Flight> flights = [];

  bool respuesta = false;

  List<DayInWeek> dayInWeekList = [
    DayInWeek('Su', isSelected: false),
    DayInWeek('M', isSelected: false),
    DayInWeek('Tu', isSelected: false),
    DayInWeek('W', isSelected: false),
    DayInWeek('T', isSelected: false),
    DayInWeek('F', isSelected: false),
    DayInWeek('S', isSelected: false),
  ];

  void cleanIsselectedDays() {
    dayInWeekList.map((e) => e.isSelected = false).toList();
    notifyListeners();
  }

  String convertDayWeekToLongDay(String day) {
    switch (day) {
      case 'Su':
        return 'Sunday';
      case 'M':
        return 'Monday';
      case 'Tu':
        return 'Tuesday';
      case 'W':
        return 'Wednsday';
      case 'T':
        return 'Thursday';
      case 'F':
        return 'Friday';
      case 'S':
        return 'Saturday';

      default:
        return '';
    }
  }

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

  Future<List<Flight>> getFlightwithoutStream() async {
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

  Future<bool> getFlightsBy() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('$ip/flights/getFlightsBy'));

    request.body = json.encode(body);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String respuesta = await response.stream.bytesToString();
      final List<dynamic> decodedResp = json.decode(respuesta);
      flights.clear();
      decodedResp.map((item) {
        flights.add(Flight.fromMap(item));
      }).toList();
      return true;
    } else {
      return false;
    }
  }

  void addtoBody() {
    if (flightNumber != "") {
      body.addAll({"flightNumber": flightNumber});
    }

    if (dateFrom != "") {
      body.addAll({"dateFrom": dateFrom});
    }
    if (dateTo != "") {
      body.addAll({"dateTo": dateTo});
    }
    if (selectedCharter != "") {
      body.addAll({"charter": selectedCharter});
    }
    if (selectedRouteFrom != "") {
      body.addAll({"from": selectedRouteFrom});
    }
    if (selectedRouteTo != "") {
      body.addAll({"to": selectedRouteTo});
    }
    if (selectedWeekDay != "") {
      body.addAll({"weekDays": selectedWeekDay});
    }
    if (selectedGate != "") {
      body.addAll({"gate": selectedGate});
    }

    print(body);
  }

  // bool? selectedStatus;

  void cleanValues() {
    flightNumber = '';
    dateFrom = '';
    dateTo = '';
    selectedCharter = '';
    selectedRouteFrom = '';
    selectedRouteTo = '';
    selectedWeekDay = '';
    selectedGate = '';
    selectedStatus;

    body.clear();
  }
}
