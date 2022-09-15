import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/Constants/day_in_week.dart';
import 'package:http/http.dart' as http;

import '../../DataLayer/Models/flight_model.dart';

class FlightProvider extends ChangeNotifier {
//vuelo seleccionado  llegada y metodos get y set//
  int indexselectedFlightReturn = 0;

  setindexselectedFlightReturn(int valor) {
    indexselectedFlightReturn = valor;
    notifyListeners();
  }

  // int get indexselectedFlightReturn => _indexselectedFlightReturn;

  // set indexselectedFlightReturn(int indexselectedFlightReturn) {
  //   _indexselectedFlightReturn = indexselectedFlightReturn;
  //   notifyListeners();
  // }

  //vuelo seleccionado  partida y metodos get y set//

  int indexselectedFlightDeparture = 0;

  setindexselectedFlightDeparture(int valor) {
    indexselectedFlightDeparture = valor;
    notifyListeners();
  }

  // int get indexselectedFlightDeparture => _indexselectedFlightDeparture;

  // set indexselectedFlightDeparture(int indexselectedFlightDeparture) {
  //   _indexselectedFlightDeparture = indexselectedFlightDeparture;
  //   notifyListeners();
  // }

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

  //campo de fecha de retorno elejida por el usuario//
  String userReturnDay = "";

  //campo de fecha de retorno notificar para redibujar//

  void changeuserReturnDay(String x) {
    userReturnDay = x;
    notifyListeners();
  }

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

//Este es el arreglo de todos los vuelos..
  List<Flight> departureflights = [];

//Este es el arreglo de todos los vuelos de partida..
  List<Flight> returnflights = [];

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

  String convertDayMonthToLeterDay(String fecha) {
    // 2022/09/20
    String mes = fecha.substring(5, 7);
    print(mes);
    String dia = fecha.substring(fecha.length - 2, fecha.length);

    if (mes == "01") {
      return "Jan" "$dia";
    }
    if (mes == "02") {
      return "Feb" "$dia";
    }
    if (mes == "03") {
      return "Mar" "$dia";
    }

    if (mes == "04") {
      return "Apr" "$dia";
    }
    if (mes == "05") {
      return "May" "$dia";
    }
    if (mes == "06") {
      return "Jun" "$dia";
    }
    if (mes == "07") {
      return "Jul" "$dia";
    }
    if (mes == "08") {
      return "Aug" "$dia";
    }
    if (mes == "09") {
      return "Sep" "$dia";
    }
    if (mes == "10") {
      return "Oct" "$dia";
    }
    if (mes == "11") {
      return "Nov" "$dia";
    }
    if (mes == "12") {
      return "Dec" "$dia";
    }

    return "";
  }

  Future<bool> getFlights() async {
    var request = http.Request('GET', Uri.parse('$ip/flights'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String respuesta = await response.stream.bytesToString();
      final List<dynamic> decodedResp = json.decode(respuesta);
      departureflights.clear();
      for (int i = 0; i < decodedResp.length; i++) {
        departureflights.add(Flight.fromMap(decodedResp[i]));
      }
      return true;
    } else {
      return false;
    }
  }

  Future<List<Flight>> getFlightwithoutStream() async {
    departureflights.clear();
    var response = await http.get(Uri.parse('$ip/flights'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedResp = json.decode(response.body);
      decodedResp.map((item) {
        departureflights.add(Flight.fromMap(item));
      }).toList();

      respuesta = true;
    }

    return departureflights;
  }

  Future<bool> getFlightsByFilters() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('$ip/flights/getFlightsBy'));

    request.body = json.encode(body);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String respuesta = await response.stream.bytesToString();
      final List<dynamic> decodedResp = json.decode(respuesta);
      departureflights.clear();
      decodedResp.map((item) {
        departureflights.add(Flight.fromMap(item));
      }).toList();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> verifyReturnFlights({
    required String dateReturn,
    required String from,
    required String to,
  }) async {
    returnflights.clear();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('$ip/flights/verifyReturn'));
    request.body =
        json.encode({"dateReturn": dateReturn, "from": from, "to": to});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final List<dynamic> decodedResp =
          json.decode(await response.stream.bytesToString());

      decodedResp.map((item) {
        returnflights.add(Flight.fromMap(item));
      }).toList();
      print(returnflights[0].from);
      notifyListeners();

      return true;
    } else {
      print(response.reasonPhrase);
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
