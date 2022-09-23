import 'package:flutter/material.dart';

import '../../../DataLayer/Models/contact_model.dart';

class ContactFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formkey3 = GlobalKey<FormState>();
  GlobalKey<FormState> formkey4 = GlobalKey<FormState>();
  GlobalKey<FormState> formkey5 = GlobalKey<FormState>();

  Contact? formContact;

  changestate(String valor) {
    notifyListeners();
    return valor;
  }

  bool isValidForm1() {
    return formkey1.currentState?.validate() ?? false;
  }

  bool isValidForm2() {
    return formkey2.currentState?.validate() ?? false;
  }

  bool isValidForm3() {
    return formkey3.currentState?.validate() ?? false;
  }

  bool isValidForm4() {
    return formkey4.currentState?.validate() ?? false;
  }

  bool isValidForm5() {
    return formkey5.currentState?.validate() ?? false;
  }
}
