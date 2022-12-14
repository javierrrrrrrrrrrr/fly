import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../Constants/contants.dart';
import '../../DataLayer/Models/contact_model.dart';
import '../../DataLayer/Models/user_model.dart';
import '../../UI/Widgets/widgets.dart';

class LoginProvider extends ChangeNotifier {
  bool islogedUser = false;
  User? loggedUser;
  List<Contact> contactList = [];
  List<int> selectedcontactIDList = [];
  String? _deviceId;
  String? uuidGenerated;
  bool isUuidGenerated = false;

  //converitr arreglo de string a int

  //add selected contact list
  void addselectedcontactlist(value) {
    selectedcontactIDList.add(int.parse(value));
    notifyListeners();
  }

  void deleteselectedcontactlist(value) {
    selectedcontactIDList.remove(value);
    notifyListeners();
  }

  String findNameByid(String id) {
    String resp = '';
    for (int i = 0; i < contactList.length; i++) {
      if (contactList[i].id.toString() == id) {
        resp = contactList[i].firstName;
      }
    }
    return resp;
  }

  //Datos de login nomral

  String email = '';
  String password = '';
  String error = "";

  LoginProvider() {
    // uUIDMaker();

    // initPlatformState();
  }

//Este es el metodo Para obtener el id unico del deispositivo.....
  Future<void> initPlatformState() async {
    String? deviceId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    _deviceId = deviceId;
    print("deviceId->$_deviceId");
  }

  getAllContacts() {
    loggedUser!.user.userContacts!.map((item) {
      contactList.add(item);
    }).toList();
    notifyListeners();
  }

  Future<bool> uUIDMaker() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var uuid = const Uuid();
      bool? isUuidWritten = prefs.getBool('uuid');
      String? valueUuidSharedP = prefs.getString('uuidValue');

      if (isUuidWritten == false ||
          isUuidWritten == null ||
          valueUuidSharedP == null ||
          valueUuidSharedP == '') {
        uuidGenerated = uuid.v4();

        await prefs.setBool('uuid', true);
        await prefs.setString('uuidValue', uuidGenerated!);
        await createMobileUser();
      }

      print(prefs.getString('uuidValue'));
      await loginMobileUser();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createMobileUser() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      var uuidValue = prefs.getString('uuidValue');
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse('$kip/auth/register_mobile'));
      request.body = json.encode({"mobile_uuid": uuidValue});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        //   await prefs.setString('uuidValue', '');
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      //   await prefs.setString('uuidValue', '');
      print(e);
      return false;
    }
  }

  Future<bool> loginMobileUser() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      var uuidValue = prefs.getString('uuidValue');
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('$kip/auth/login_mobile'));
      request.body = json.encode({"mobile_uuid": uuidValue});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String respuesta = await response.stream.bytesToString();
        final Map<String, dynamic> decodedResp = json.decode(respuesta);

        loggedUser = User.fromMap(decodedResp);
        prefs.setString('jwt', loggedUser!.jwt);
        getAllContacts();
        islogedUser = true;
        print(prefs.getString('jwt'));
        return true;
      } else {
        print(response.reasonPhrase);
        //  await prefs.setString('uuidValue', '');
        return false;
      }
    } catch (e) {
      //  await prefs.setString('uuidValue', '');
      print(e);
      return false;
    }
  }

  Future<bool> createNomralUser() async {
    var headers = {
      'Authorization': loggedUser!.jwt,
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$kip/auth/register'));
    request.body =
        json.encode({"name": "Adonys", "email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String respuesta = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return true;
    } else {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      error = decodedResp["clientErrorMessage"];
      notifyListeners();
      return false;
    }
  }

  Future<bool> loginNormalUser() async {
    final prefs = await SharedPreferences.getInstance();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$kip/auth/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String respuesta = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      loggedUser = User.fromMap(decodedResp);
      prefs.setString('jwt', loggedUser!.jwt);
      getAllContacts();
      islogedUser = true;
      return true;
    } else {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      error = decodedResp["clientErrorMessage"];
      notifyListeners();
      return false;
    }
  }
}
