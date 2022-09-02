// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Flight {
  Flight({
    required this.id,
    required this.date,
    required this.day,
    required this.charter,
    required this.flightNumber,
    required this.from,
    required this.to,
    required this.checkIn,
    required this.departure,
    required this.arrival,
    required this.gate,
    required this.reservedSeats,
    required this.openSeats,
    required this.status,
    required this.adultPrice,
    required this.childPrice,
    required this.boysPrice,
    required this.createdAt,
    required this.isDeleted,
  });

  int id;
  String date;
  String day;
  String charter;
  String flightNumber;
  String from;
  String to;
  String checkIn;
  String departure;
  String arrival;
  String gate;
  String reservedSeats;
  String openSeats;
  String status;
  int adultPrice;
  int childPrice;
  int boysPrice;
  DateTime createdAt;
  bool isDeleted;

  factory Flight.fromJson(String str) => Flight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flight.fromMap(Map<String, dynamic> json) => Flight(
        id: json["id"],
        date: json["date"],
        day: json["day"],
        charter: json["charter"],
        flightNumber: json["flightNumber"],
        from: json["from"],
        to: json["to"],
        checkIn: json["checkIn"],
        departure: json["departure"],
        arrival: json["arrival"],
        gate: json["gate"],
        reservedSeats: json["reservedSeats"],
        openSeats: json["openSeats"],
        status: json["status"],
        adultPrice: json["adultPrice"],
        childPrice: json["childPrice"],
        boysPrice: json["boysPrice"],
        createdAt: DateTime.parse(json["createdAt"]),
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "day": day,
        "charter": charter,
        "flightNumber": flightNumber,
        "from": from,
        "to": to,
        "checkIn": checkIn,
        "departure": departure,
        "arrival": arrival,
        "gate": gate,
        "reservedSeats": reservedSeats,
        "openSeats": openSeats,
        "status": status,
        "adultPrice": adultPrice,
        "childPrice": childPrice,
        "boysPrice": boysPrice,
        "createdAt": createdAt.toIso8601String(),
        "isDeleted": isDeleted,
      };
}
