// To parse this JSON data, do
//
//     final payFlyModel = payFlyModelFromMap(jsonString);

import 'dart:convert';

class PayFlyModel {
  PayFlyModel({
    required this.id,
    this.userId,
    this.paymentsId,
    required this.flightOut,
    required this.flightIn,
    required this.isDeleted,
    required this.createdAt,
    required this.status,
    required this.subtotal,
    required this.total,
    required this.fees,
    required this.user,
    required this.flightOutRelation,
    required this.flightInRelation,
    required this.bookingsContacts,
  });

  int id;
  int? userId;
  dynamic paymentsId;
  int flightOut;
  int flightIn;
  bool isDeleted;
  String createdAt;
  String status;
  int subtotal;
  int total;
  int fees;
  User user;
  FlightRelation flightOutRelation;
  FlightRelation flightInRelation;
  List<BookingsContact> bookingsContacts;

  PayFlyModel copyWith({
    int? id,
    int? flightIn,
    bool? isDeleted,
    String? createdAt,
    String? status,
    int? subtotal,
    int? total,
    int? fees,
    User? user,
    FlightRelation? flightOutRelation,
    FlightRelation? flightInRelation,
    List<BookingsContact>? bookingsContacts,
  }) =>
      PayFlyModel(
        id: id ?? this.id,
        userId: userId ?? userId,
        paymentsId: paymentsId ?? paymentsId,
        flightOut: flightOut,
        flightIn: flightIn ?? this.flightIn,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        status: status ?? this.status,
        subtotal: subtotal ?? this.subtotal,
        total: total ?? this.total,
        fees: fees ?? this.fees,
        user: user ?? this.user,
        flightOutRelation: flightOutRelation ?? this.flightOutRelation,
        flightInRelation: flightInRelation ?? this.flightInRelation,
        bookingsContacts: bookingsContacts ?? this.bookingsContacts,
      );

  factory PayFlyModel.fromJson(String str) =>
      PayFlyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayFlyModel.fromMap(Map<String, dynamic> json) => PayFlyModel(
        id: json["id"],
        userId: json["userId"],
        paymentsId: json["paymentsId"],
        flightOut: json["flightOut"],
        flightIn: json["flightIn"],
        isDeleted: json["isDeleted"],
        createdAt: json["createdAt"],
        status: json["status"],
        subtotal: json["subtotal"],
        total: json["total"],
        fees: json["fees"],
        user: User.fromMap(json["user"]),
        flightOutRelation: FlightRelation.fromMap(json["flightOutRelation"]),
        flightInRelation: FlightRelation.fromMap(json["flightInRelation"]),
        bookingsContacts: List<BookingsContact>.from(
            json["BookingsContacts"].map((x) => BookingsContact.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "paymentsId": paymentsId,
        "flightOut": flightOut,
        "flightIn": flightIn,
        "isDeleted": isDeleted,
        "createdAt": createdAt,
        "status": status,
        "subtotal": subtotal,
        "total": total,
        "fees": fees,
        "user": user.toMap(),
        "flightOutRelation": flightOutRelation.toMap(),
        "flightInRelation": flightInRelation.toMap(),
        "BookingsContacts":
            List<dynamic>.from(bookingsContacts.map((x) => x.toMap())),
      };
}

class BookingsContact {
  BookingsContact({
    required this.id,
    required this.bookingId,
    required this.contactId,
    required this.contact,
  });

  int id;
  int bookingId;
  int contactId;
  Contact contact;

  BookingsContact copyWith({
    int? id,
    int? bookingId,
    int? contactId,
    Contact? contact,
  }) =>
      BookingsContact(
        id: id ?? this.id,
        bookingId: bookingId ?? this.bookingId,
        contactId: contactId ?? this.contactId,
        contact: contact ?? this.contact,
      );

  factory BookingsContact.fromJson(String str) =>
      BookingsContact.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingsContact.fromMap(Map<String, dynamic> json) => BookingsContact(
        id: json["id"],
        bookingId: json["bookingId"],
        contactId: json["contactId"],
        contact: Contact.fromMap(json["contact"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "bookingId": bookingId,
        "contactId": contactId,
        "contact": contact.toMap(),
      };
}

class Contact {
  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.passengerType,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phone,
    required this.address,
    required this.cyti,
    required this.state,
    required this.zip,
    required this.country,
    required this.nationality,
    required this.ofacCode,
    required this.mothersMaiden,
    required this.foreignAddress,
    required this.foreignCity,
    required this.foreignProvince,
    required this.foreignZip,
    required this.emergencyName,
    required this.emergencyPhone,
    required this.cubanFirstName,
    required this.cubanLastName,
    required this.arrivalDoc,
    required this.countryOfIssue,
    required this.arrivalDocNo,
    required this.expDate,
    required this.arrivalDocSec,
    required this.countryOfIssueSec,
    required this.arrivalDocNoSec,
    required this.expDateSec,
    required this.usersId,
    this.value,
  });

  int id;
  String firstName;
  String lastName;
  String passengerType;
  String birthDate;
  String gender;
  String email;
  String phone;
  String address;
  String cyti;
  String state;
  String zip;
  String country;
  String nationality;
  String ofacCode;
  String mothersMaiden;
  String foreignAddress;
  String foreignCity;
  String foreignProvince;
  String foreignZip;
  String emergencyName;
  String emergencyPhone;
  String cubanFirstName;
  String cubanLastName;
  String arrivalDoc;
  String countryOfIssue;
  String arrivalDocNo;
  String expDate;
  String arrivalDocSec;
  String countryOfIssueSec;
  String arrivalDocNoSec;
  String expDateSec;
  int usersId;
  int? value;

  Contact copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? passengerType,
    String? birthDate,
    String? gender,
    String? email,
    String? phone,
    String? address,
    String? cyti,
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
    int? value,
  }) =>
      Contact(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        passengerType: passengerType ?? this.passengerType,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        cyti: cyti ?? this.cyti,
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
        arrivalDocSec: arrivalDocSec ?? this.arrivalDocSec,
        countryOfIssueSec: countryOfIssueSec ?? this.countryOfIssueSec,
        arrivalDocNoSec: arrivalDocNoSec ?? this.arrivalDocNoSec,
        expDateSec: expDateSec ?? this.expDateSec,
        usersId: usersId ?? this.usersId,
        value: value ?? this.value,
      );

  factory Contact.fromJson(String str) => Contact.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        passengerType: json["passengerType"],
        birthDate: json["birthDate"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        cyti: json["cyti"],
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
        arrivalDocSec: json["arrivalDocSec"],
        countryOfIssueSec: json["countryOfIssueSec"],
        arrivalDocNoSec: json["arrivalDocNoSec"],
        expDateSec: json["expDateSec"],
        usersId: json["usersId"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "passengerType": passengerType,
        "birthDate": birthDate,
        "gender": gender,
        "email": email,
        "phone": phone,
        "address": address,
        "cyti": cyti,
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
        "arrivalDocSec": arrivalDocSec,
        "countryOfIssueSec": countryOfIssueSec,
        "arrivalDocNoSec": arrivalDocNoSec,
        "expDateSec": expDateSec,
        "usersId": usersId,
        "value": value,
      };
}

class FlightRelation {
  FlightRelation({
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
  String createdAt;
  bool isDeleted;

  FlightRelation copyWith({
    int? id,
    String? date,
    String? day,
    String? charter,
    String? flightNumber,
    String? from,
    String? to,
    String? checkIn,
    String? departure,
    String? arrival,
    String? gate,
    String? reservedSeats,
    String? openSeats,
    String? status,
    int? adultPrice,
    int? childPrice,
    int? boysPrice,
    String? createdAt,
    bool? isDeleted,
  }) =>
      FlightRelation(
        id: id ?? this.id,
        date: date ?? this.date,
        day: day ?? this.day,
        charter: charter ?? this.charter,
        flightNumber: flightNumber ?? this.flightNumber,
        from: from ?? this.from,
        to: to ?? this.to,
        checkIn: checkIn ?? this.checkIn,
        departure: departure ?? this.departure,
        arrival: arrival ?? this.arrival,
        gate: gate ?? this.gate,
        reservedSeats: reservedSeats ?? this.reservedSeats,
        openSeats: openSeats ?? this.openSeats,
        status: status ?? this.status,
        adultPrice: adultPrice ?? this.adultPrice,
        childPrice: childPrice ?? this.childPrice,
        boysPrice: boysPrice ?? this.boysPrice,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );

  factory FlightRelation.fromJson(String str) =>
      FlightRelation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlightRelation.fromMap(Map<String, dynamic> json) => FlightRelation(
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
        createdAt: json["createdAt"],
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
        "createdAt": createdAt,
        "isDeleted": isDeleted,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.mobileUuid,
    required this.email,
    required this.createdAt,
    required this.isVerified,
    required this.isDeleted,
    required this.rolesId,
  });

  int id;
  dynamic name;
  String mobileUuid;
  dynamic email;
  String createdAt;
  bool isVerified;
  bool isDeleted;
  dynamic rolesId;

  User copyWith({
    int? id,
    dynamic name,
    String? mobileUuid,
    dynamic email,
    String? createdAt,
    bool? isVerified,
    bool? isDeleted,
    dynamic rolesId,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        mobileUuid: mobileUuid ?? this.mobileUuid,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        isVerified: isVerified ?? this.isVerified,
        isDeleted: isDeleted ?? this.isDeleted,
        rolesId: rolesId ?? this.rolesId,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        mobileUuid: json["mobile_uuid"],
        email: json["email"],
        createdAt: json["createdAt"],
        isVerified: json["isVerified"],
        isDeleted: json["isDeleted"],
        rolesId: json["rolesId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "mobile_uuid": mobileUuid,
        "email": email,
        "createdAt": createdAt,
        "isVerified": isVerified,
        "isDeleted": isDeleted,
        "rolesId": rolesId,
      };
}
