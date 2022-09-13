// To parse this JSON data, do
//
//     final bookFlight = bookFlightFromMap(jsonString);

import 'dart:convert';

class BookFlight {
  BookFlight({
    required this.flightNumber,
    required this.charter,
    required this.origin,
    required this.destination,
    required this.gate,
  });

  List<FlightNumber> flightNumber;
  List<Charter> charter;
  List<Destination> origin;
  List<Destination> destination;
  List<Gate> gate;

  BookFlight copyWith({
    List<FlightNumber>? flightNumber,
    List<Charter>? charter,
    List<Destination>? origin,
    List<Destination>? destination,
    List<Gate>? gate,
  }) =>
      BookFlight(
        flightNumber: flightNumber ?? this.flightNumber,
        charter: charter ?? this.charter,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        gate: gate ?? this.gate,
      );

  factory BookFlight.fromJson(String str) =>
      BookFlight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookFlight.fromMap(Map<String, dynamic> json) => BookFlight(
        flightNumber: List<FlightNumber>.from(
            json["flightNumber"].map((x) => FlightNumber.fromMap(x))),
        charter:
            List<Charter>.from(json["charter"].map((x) => Charter.fromMap(x))),
        origin: List<Destination>.from(
            json["origin"].map((x) => Destination.fromMap(x))),
        destination: List<Destination>.from(
            json["destination"].map((x) => Destination.fromMap(x))),
        gate: List<Gate>.from(json["gate"].map((x) => Gate.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "flightNumber": List<dynamic>.from(flightNumber.map((x) => x.toMap())),
        "charter": List<dynamic>.from(charter.map((x) => x.toMap())),
        "origin": List<dynamic>.from(origin.map((x) => x.toMap())),
        "destination": List<dynamic>.from(destination.map((x) => x.toMap())),
        "gate": List<dynamic>.from(gate.map((x) => x.toMap())),
      };
}

class Charter {
  Charter({
    required this.charter,
  });

  String charter;

  Charter copyWith({
    String? charter,
  }) =>
      Charter(
        charter: charter ?? this.charter,
      );

  factory Charter.fromJson(String str) => Charter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Charter.fromMap(Map<String, dynamic> json) => Charter(
        charter: json["charter"],
      );

  Map<String, dynamic> toMap() => {
        "charter": charter,
      };
}

class Destination {
  Destination({
    required this.from,
  });

  String from;

  Destination copyWith({
    String? from,
  }) =>
      Destination(
        from: from ?? this.from,
      );

  factory Destination.fromJson(String str) =>
      Destination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Destination.fromMap(Map<String, dynamic> json) => Destination(
        from: json["from"],
      );

  Map<String, dynamic> toMap() => {
        "from": from,
      };
}

class FlightNumber {
  FlightNumber({
    required this.flightNumber,
  });

  String flightNumber;

  FlightNumber copyWith({
    String? flightNumber,
  }) =>
      FlightNumber(
        flightNumber: flightNumber ?? this.flightNumber,
      );

  factory FlightNumber.fromJson(String str) =>
      FlightNumber.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlightNumber.fromMap(Map<String, dynamic> json) => FlightNumber(
        flightNumber: json["flightNumber"],
      );

  Map<String, dynamic> toMap() => {
        "flightNumber": flightNumber,
      };
}

class Gate {
  Gate({
    required this.gate,
  });

  String gate;

  Gate copyWith({
    String? gate,
  }) =>
      Gate(
        gate: gate ?? this.gate,
      );

  factory Gate.fromJson(String str) => Gate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gate.fromMap(Map<String, dynamic> json) => Gate(
        gate: json["gate"],
      );

  Map<String, dynamic> toMap() => {
        "gate": gate,
      };
}
