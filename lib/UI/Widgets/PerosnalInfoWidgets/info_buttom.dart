import 'package:flutter/material.dart';
import '../../../Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';

class InfoButtom extends StatelessWidget {
  const InfoButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flipProvaider = Provider.of<FlipProvider>(context);
    final contactFormProvider = Provider.of<ContactFormProvider>(context);
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: size.width * 0.8,
      color: Colors.blue,
      height: size.height * 0.075,
      onPressed: () async {
        if (flipProvaider.flip == 0) {
          if (contactFormProvider.isValidForm1()) {
           
            FocusManager.instance.primaryFocus?.unfocus();
            flipProvaider.checkFlip(context);
          }
        }
        if (flipProvaider.flip == 1) {
          if (contactFormProvider.isValidForm2()) {
          
            FocusManager.instance.primaryFocus?.unfocus();
            flipProvaider.checkFlip(context);
          }
        }
        if (flipProvaider.flip == 2) {
          if (contactFormProvider.isValidForm3()) {
           
            FocusManager.instance.primaryFocus?.unfocus();
            flipProvaider.checkFlip(context);
          }
        }
        if (flipProvaider.flip == 3) {
          if (contactFormProvider.isValidForm4()) {
           
            FocusManager.instance.primaryFocus?.unfocus();
            flipProvaider.checkFlip(context);
          }
        }
        if (flipProvaider.flip == 4) {
          if (contactFormProvider.isValidForm5()) {
           
            FocusManager.instance.primaryFocus?.unfocus();
            flipProvaider.checkFlip(context);
          }
        }
      },
      child: const Text(
        "Continuar",
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
