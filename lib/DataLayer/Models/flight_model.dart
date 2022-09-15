import 'dart:convert';

import 'package:equatable/equatable.dart';

class Flight extends Equatable {
  const Flight({
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

  final int id;
  final String date;
  final String day;
  final String charter;
  final String flightNumber;
  final String from;
  final String to;
  final String checkIn;
  final String departure;
  final String arrival;
  final String gate;
  final String reservedSeats;
  final String openSeats;
  final String status;
  final int adultPrice;
  final int childPrice;
  final int boysPrice;
  final DateTime createdAt;
  final bool isDeleted;

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

  @override
  List<Object?> get props => [
        id,
        date,
        day,
        charter,
        flightNumber,
        from,
        to,
        checkIn,
        departure,
        arrival,
        gate,
        reservedSeats,
        openSeats,
        status,
        adultPrice,
        childPrice,
        boysPrice,
        createdAt,
        isDeleted,
      ];
}
