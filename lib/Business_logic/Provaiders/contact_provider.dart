import 'dart:convert';

import 'package:fly_cliente/UI/Widgets/widgets.dart';
import 'package:http/http.dart' as http;

import '../../Constants/contants.dart';
import '../../DataLayer/Models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts = [];
  Contact? selectedContact;

  String error = "";

  List<Contact> foundedContacts = [];
  ContactProvider() {
    foundedContacts = contacts;
  }

  udateListContacts(String search) {
    foundedContacts = contacts
        .where((user) => user.firstName.toLowerCase().contains(search))
        .toList();
    notifyListeners();
  }

  Future<bool> getsContacts(String token) async {
    contacts.clear();
    var headers = {'Authorization': token};
    var request = http.Request('GET', Uri.parse('$ip/contacts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String respuesta = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      //para igualar las lista ya q como se muestra es la filtrada no dejar de motrar los valores q no coincidan con el criterio de busqueda
      final List<dynamic> decodedResp = json.decode(respuesta);
      decodedResp.map((item) {
        contacts.add(Contact.fromMap(item));
      }).toList();

      foundedContacts = contacts;
      foundedContacts.sort((a, b) => a.firstName.compareTo(b.firstName));
      return true;
    } else {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      error = decodedResp["clientErrorMessage"];
      return false;
    }
  }

  Future<bool> createContact(String token) async {
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$ip/contacts'));
    request.body = json.encode({
      "firstName": "Adonys",
      "lastName": "Valdez",
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
      "expDateSec": "2022/09/03"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var respuesta = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final List<dynamic> decodedResp = json.decode(respuesta);
      // userSelected = json.decode(respuesta);
      print(selectedContact!.firstName.toString());

      return true;
    } else {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      error = decodedResp["clientErrorMessage"];
      return false;
    }
  }

  Future<bool> deleteContact(String token) async {
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request('DELETE', Uri.parse('$ip/contacts'));
    request.body = json.encode({"id": selectedContact!.id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var respuesta = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      for (int i = 0; i < foundedContacts.length; i++) {
        if (foundedContacts[i].id == selectedContact!.id) {
          foundedContacts.removeAt(i);
          // foundedContacts.removeAt(i);
        }
      }

      notifyListeners();
    } else {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      error = decodedResp["clientErrorMessage"];
      print(decodedResp["clientErrorMessage"]);
    }

    return true;
  }
}
