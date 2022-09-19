import 'package:flutter/cupertino.dart';

import '../../DataLayer/Models/user_model.dart';

class SearchProvider extends ChangeNotifier {
  List<User> contacts = [
    User(
      firstName: 'Roger',
      lastName: "Ordaz",
      passengerType: 'Adult',
    ),
    User(
      firstName: 'Javier',
      lastName: "Diaz",
      passengerType: 'Adult',
    ),
    User(
      firstName: 'Ernesto',
      lastName: "Carepimpi",
      passengerType: 'Adult',
    ),
    User(
      firstName: 'Adonis',
      lastName: "Luke",
      passengerType: 'Adult',
    ),
    User(
      firstName: 'Adonis',
      lastName: "Luke Arencibia Valdes Valdes Valdes",
      passengerType: 'Adult',
    ),
  ];
  List<User> foundedContacts = [];
  SearchProvider() {
    foundedContacts = contacts;
  }

  udateListContacts(String search) {
    foundedContacts = contacts
        .where((user) => user.firstName.toLowerCase().contains(search))
        .toList();
    notifyListeners();
  }
}
