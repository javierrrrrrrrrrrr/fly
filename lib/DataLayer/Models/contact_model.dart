// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Contact contactFromMap(String str) => Contact.fromMap(json.decode(str));

String contactToMap(Contact data) => json.encode(data.toMap());

// ignore: must_be_immutable
class Contact extends Equatable {
  Contact({
    required this.firstName,
    required this.lastName,
    required this.passengerType,
    this.id,
    this.birthDate,
    this.gender,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.nationality,
    this.ofacCode,
    this.mothersMaiden,
    this.foreignAddress,
    this.foreignCity,
    this.foreignProvince,
    this.foreignZip,
    this.emergencyName,
    this.emergencyPhone,
    this.cubanFirstName,
    this.cubanLastName,
    this.arrivalDoc,
    this.countryOfIssue,
    this.arrivalDocNo,
    this.expDate,
    this.passportNumberSec,
    this.countryOfIssueSec,
    this.arrivalDocNoSec,
    this.expDateSec,
    this.usersId,
    this.bookingsId,
  });

  String firstName;
  String lastName;
  String passengerType;
  int? id;
  String? birthDate;
  String? gender;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? nationality;
  String? ofacCode;
  String? mothersMaiden;
  String? foreignAddress;
  String? foreignCity;
  String? foreignProvince;
  String? foreignZip;
  String? emergencyName;
  String? emergencyPhone;
  String? cubanFirstName;
  String? cubanLastName;
  String? arrivalDoc;
  String? countryOfIssue;
  String? arrivalDocNo;
  String? expDate;
  String? passportNumberSec;
  String? countryOfIssueSec;
  String? arrivalDocNoSec;
  String? expDateSec;
  int? usersId;
  int? bookingsId;

  Contact copyWith({
    String? firstName,
    String? lastName,
    String? passengerType,
    int? id,
    String? birthDate,
    String? gender,
    String? email,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? zip,
    String? country,
    String? nationality,
    String? ofacCode,
    String? mothersMaiden,
    String? foreignAddress,
    String? foreignCity,
    String? foreignProvince,
    String? foreignZip,
    String? emergencyName,
    String? emergencyPhone,
    String? cubanFirstName,
    String? cubanLastName,
    String? arrivalDoc,
    String? countryOfIssue,
    String? arrivalDocNo,
    String? expDate,
    String? arrivalDocSec,
    String? countryOfIssueSec,
    String? arrivalDocNoSec,
    String? expDateSec,
    int? usersId,
    int? bookingsId,
  }) =>
      Contact(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        passengerType: passengerType ?? this.passengerType,
        id: id ?? this.id,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        city: city ?? city,
        state: state ?? this.state,
        zip: zip ?? this.zip,
        country: country ?? this.country,
        nationality: nationality ?? this.nationality,
        ofacCode: ofacCode ?? this.ofacCode,
        mothersMaiden: mothersMaiden ?? this.mothersMaiden,
        foreignAddress: foreignAddress ?? this.foreignAddress,
        foreignCity: foreignCity ?? this.foreignCity,
        foreignProvince: foreignProvince ?? this.foreignProvince,
        foreignZip: foreignZip ?? this.foreignZip,
        emergencyName: emergencyName ?? this.emergencyName,
        emergencyPhone: emergencyPhone ?? this.emergencyPhone,
        cubanFirstName: cubanFirstName ?? this.cubanFirstName,
        cubanLastName: cubanLastName ?? this.cubanLastName,
        arrivalDoc: arrivalDoc ?? this.arrivalDoc,
        countryOfIssue: countryOfIssue ?? this.countryOfIssue,
        arrivalDocNo: arrivalDocNo ?? this.arrivalDocNo,
        expDate: expDate ?? this.expDate,
        passportNumberSec: arrivalDocSec ?? passportNumberSec,
        countryOfIssueSec: countryOfIssueSec ?? this.countryOfIssueSec,
        arrivalDocNoSec: arrivalDocNoSec ?? this.arrivalDocNoSec,
        expDateSec: expDateSec ?? this.expDateSec,
        usersId: usersId ?? this.usersId,
        bookingsId: bookingsId ?? this.bookingsId,
      );

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        firstName: json["firstName"],
        lastName: json["lastName"],
        passengerType: json["passengerType"],
        id: json["id"],
        birthDate: json["birthDate"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        city: json["cyti"],
        state: json["state"],
        zip: json["zip"],
        country: json["country"],
        nationality: json["nationality"],
        ofacCode: json["ofacCode"],
        mothersMaiden: json["mothersMaiden"],
        foreignAddress: json["foreignAddress"],
        foreignCity: json["foreignCity"],
        foreignProvince: json["foreignProvince"],
        foreignZip: json["foreignZip"],
        emergencyName: json["emergencyName"],
        emergencyPhone: json["emergencyPhone"],
        cubanFirstName: json["cubanFirstName"],
        cubanLastName: json["cubanLastName"],
        arrivalDoc: json["arrivalDoc"],
        countryOfIssue: json["countryOfIssue"],
        arrivalDocNo: json["arrivalDocNo"],
        expDate: json["expDate"],
        passportNumberSec: json["arrivalDocSec"],
        countryOfIssueSec: json["countryOfIssueSec"],
        arrivalDocNoSec: json["arrivalDocNoSec"],
        expDateSec: json["expDateSec"],
        usersId: json["usersId"],
        bookingsId: json["bookingsId"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "passengerType": passengerType,
        "id": id,
        "birthDate": birthDate,
        "gender": gender,
        "email": email,
        "phone": phone,
        "address": address,
        "cyti": city,
        "state": state,
        "zip": zip,
        "country": country,
        "nationality": nationality,
        "ofacCode": ofacCode,
        "mothersMaiden": mothersMaiden,
        "foreignAddress": foreignAddress,
        "foreignCity": foreignCity,
        "foreignProvince": foreignProvince,
        "foreignZip": foreignZip,
        "emergencyName": emergencyName,
        "emergencyPhone": emergencyPhone,
        "cubanFirstName": cubanFirstName,
        "cubanLastName": cubanLastName,
        "arrivalDoc": arrivalDoc,
        "countryOfIssue": countryOfIssue,
        "arrivalDocNo": arrivalDocNo,
        "expDate": expDate,
        "arrivalDocSec": passportNumberSec,
        "countryOfIssueSec": countryOfIssueSec,
        "arrivalDocNoSec": arrivalDocNoSec,
        "expDateSec": expDateSec,
        "usersId": usersId,
        "bookingsId": bookingsId,
      };

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        passengerType,
        id,
        birthDate,
        gender,
        email,
        phone,
        address,
        city,
        state,
        zip,
        country,
        nationality,
        ofacCode,
        mothersMaiden,
        foreignAddress,
        foreignCity,
        foreignProvince,
        foreignZip,
        emergencyName,
        emergencyPhone,
        cubanFirstName,
        cubanLastName,
        arrivalDoc,
        countryOfIssue,
        arrivalDocNo,
        expDate,
        passportNumberSec,
        countryOfIssueSec,
        arrivalDocNoSec,
        expDateSec,
        usersId,
        bookingsId,
      ];
}
