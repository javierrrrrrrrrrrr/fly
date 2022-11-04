import 'dart:convert';

import 'login_provider.dart';
import '../../UI/Widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../Constants/contants.dart';
import '../../DataLayer/Models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts = [];
  Contact? selectedContact;

  List<String> countryNames = [];

  String error = "";

  List<Contact> foundedContacts = [];

  ContactProvider() {
    selectedContact = Contact(
      firstName: '',
      lastName: '',
      email: '',
      passengerType: '',
    );
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
    var request = http.Request('GET', Uri.parse('$kip/contacts'));

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

  Future<bool> deleteContact(String token, BuildContext context) async {
    final loginProvider = context.read<LoginProvider>();
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request('DELETE', Uri.parse('$kip/contacts'));
    request.body = json.encode({"id": selectedContact!.id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var respuesta = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      for (int i = 0; i < foundedContacts.length; i++) {
        if (foundedContacts[i].id == selectedContact!.id) {
          foundedContacts.removeAt(i);
          loginProvider.contactList.removeAt(i);

          // foundedContacts.removeAt(i);
        }
      }
      notifyListeners();
      return true;
    } else {
      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      error = decodedResp["clientErrorMessage"];
      print(decodedResp["clientErrorMessage"]);
      //mostrar al usruio cartel de no se pudo borrar el contacto
      return false;
    }
  }

  Future<Contact?> createContact(
      {required Contact contact,
      required String token,
      required BuildContext context}) async {
    final loginProvider = context.read<LoginProvider>();
    var url = Uri.parse('$kip/contacts');
    final response = await http.post(url,
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
        body: json.encode(contact.toMap()));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);
      Contact newContact = Contact.fromMap(decodedResp);

      foundedContacts.add(newContact);
      foundedContacts.sort((a, b) => a.firstName.compareTo(b.firstName));
      loginProvider.contactList.add(newContact);
      notifyListeners();

      return newContact;
    } else {
      //print
      return null;
    }
  }

  Future<Contact?> updateContact(
      {required Contact contact, required String token}) async {
    var url = Uri.parse('$kip/contacts');

    final response = await http.put(url,
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
        body: json.encode(contact.toMap()));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);

      Contact newContact = Contact.fromMap(decodedResp);

      final index =
          foundedContacts.indexWhere((element) => element.id == contact.id);

      foundedContacts[index] = newContact;
      notifyListeners();

      return newContact;
    } else {
      return null;
    }
  }

  Future<bool> getCountryName() async {
    //   List<String> countryName = [];

    var request =
        http.Request('GET', Uri.parse('https://restcountries.com/v3.1/all'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String respuesta = await response.stream.bytesToString();
      final List<dynamic> decodedResp = json.decode(respuesta);
      for (int i = 0; i < decodedResp.length; i++) {
        countryNames.add(decodedResp[i]["name"]["common"]);
      }
      countryNames.sort((a, b) => a.compareTo(b));
      //  print(decodedResp[1]["name"]["common"]);
      return true;
      //  final Map<String, dynamic> decodedResp = json.decode(response.body);
    } else {
      return false;
    }
  }

//   List<int> getIdContacts() {
//     List<int> idContacts = [];
//     for (int i = 0; i < foundedContacts.length; i++) {
//       idContacts.add(foundedContacts[i].id!);
//     }
//     return idContacts;
//   }
}
