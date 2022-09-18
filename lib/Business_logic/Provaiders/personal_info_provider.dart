import 'dart:convert';

import 'package:fly_cliente/UI/Widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PersonalInfoProvider extends ChangeNotifier {
  String? fistName;
  String? lastName;
  String? passengerType;
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
  String? motherMaiden;
  String? foreingAddress;
  String? foreingCity;
  String? foreingProvince;
  String? foreingZip;
  String? emergencyNumber;
  String? emergencyphone;
  String? cubanFirstName;
  String? cubanLastName;
  String? arrivalDoc;
  String? countryIssue;
  String? primaryArrivalDocNo;
  String? primaryExpDate;
  String? passport;
  String? countryOfIssue;
  String? secundaryArrivalDocNo;
  String? secundaryExpDate;

  Future<void> storeInfoInSharedPref() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('firsname', fistName ?? '');
    await prefs.setString('lastName', lastName ?? '');
    await prefs.setString('passengerType', passengerType ?? '');
    await prefs.setString('birthDate', birthDate ?? '');
    await prefs.setString('gender', gender ?? '');
    await prefs.setString('email', email ?? '');
    await prefs.setString('phone', phone ?? '');
    await prefs.setString('address', address ?? '');
    await prefs.setString('city', city ?? '');
    await prefs.setString('state', state ?? '');
    await prefs.setString('zip', zip ?? '');
    await prefs.setString('country', country ?? '');
    await prefs.setString('nationality', nationality ?? '');
    await prefs.setString('ofacCode', ofacCode ?? '');
    await prefs.setString('motherMaiden', motherMaiden ?? '');
    await prefs.setString('foreingAddress', foreingAddress ?? '');
    await prefs.setString('foreingCity', foreingCity ?? '');
    await prefs.setString('foreingProvince', foreingProvince ?? '');
    await prefs.setString('foreingZip', foreingZip ?? '');
    await prefs.setString('emergencyNumber', emergencyNumber ?? '');
    await prefs.setString('emergencyphone', emergencyphone ?? '');
    await prefs.setString('cubanFirstName', cubanFirstName ?? '');
    await prefs.setString('cubanLastName', cubanLastName ?? '');
    await prefs.setString('arrivalDoc', arrivalDoc ?? '');
    await prefs.setString('primaryArrivalDocNo', primaryArrivalDocNo ?? '');
    await prefs.setString('primaryExpDate', primaryExpDate ?? '');
    await prefs.setString('passport', passport ?? '');
    await prefs.setString('countryOfIssue', countryOfIssue ?? '');
    await prefs.setString('secundaryArrivalDocNo', secundaryArrivalDocNo ?? '');
    await prefs.setString('secundaryExpDate', secundaryExpDate ?? '');
  }

  Future<bool> storeUserInfo() async {
    var url = Uri.parse(':3000/contacts');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "firstName": fistName,
          "lastName": "test",
          "passengerType": "test",
          "birthDate": "2022/09/01",
          "gender": "test",
          "email": "test",
          "phone": "test",
          "address": "test",
          "cyti": "test",
          "state": "test",
          "zip": "test",
          "country": "test",
          "nationality": "test",
          "ofacCode": "test",
          "mothersMaiden": "ttest",
          "foreignAddress": "test",
          "foreignCity": "test",
          "foreignProvince": "test",
          "foreignZip": "test",
          "emergencyName": "test",
          "emergencyPhone": "test",
          "cubanFirstName": "test",
          "cubanLastName": "test",
          "arrivalDoc": "test",
          "countryOfIssue": "tets",
          "arrivalDocNo": "test",
          "expDate": "2022/09/03",
          "arrivalDocSec": "test",
          "countryOfIssueSec": "test",
          "arrivalDocNoSec": "test",
          "expDateSec": "2022/09/03",
          "usersId": 1,
          "bookingsId": 1
        }));

    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
    }

    return false;
  }
}
