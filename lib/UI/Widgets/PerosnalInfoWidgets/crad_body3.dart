import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../SeparationWidget/separador.dart';
import '../imput_field.dart';

class CardBody3 extends StatelessWidget {
  const CardBody3(
      {Key? key,
      this.space,
      required this.ofacCode,
      required this.motherMaiden,
      required this.foreignAdress,
      required this.foreignCity,
      required this.foreignprovince,
      required this.foreignZipCode,
      required this.emergencyName,
      this.spacenamed})
      : super(key: key);

  final double? space;

  //bool para controlar el espacio entre los campos
  final bool? spacenamed;

  final String ofacCode;
  final String motherMaiden;
  final String foreignAdress;
  final String foreignCity;
  final String foreignprovince;
  final String foreignZipCode;
  final String emergencyName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    final contactProvider = Provider.of<ContactProvider>(context);
    final contactFormProvider = Provider.of<ContactFormProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Form(
        key: contactFormProvider.formkey3,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Flight Information",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "OFAC Code",
                  ),

            CustomDropDown(
              iconData: Icons.description_outlined,
              contentPadding: EdgeInsets.only(left: size.width * 0.095),
              //TODO: Lenar el dropdownn con la lista de ofac codes here...
              items: const [
                'Code 1',
                'Code 2',
                'Code 3',
              ],
              hintext: ofacCode,
              onChanged: (value) =>
                  contactProvider.selectedContact!.ofacCode = value.toString(),
              onSaved: (value) =>
                  contactProvider.selectedContact!.ofacCode = value.toString(),
            ),
            // Imputfield(
            //   avalible: flipProvaider.avalible,
            //   hintext: "Ofac Code",
            //   suffixIcon: flipProvaider.avalible
            //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
            //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
            //   prefixIcon: flipProvaider.avalible
            //       ? const Icon(Icons.description_outlined, color: Colors.blue)
            //       : const Icon(Icons.description_outlined, color: Colors.grey),
            // ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Mother Maiden",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.mothersMaiden = value,
              avalible: flipProvaider.avalible,
              hintext: motherMaiden,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.description_outlined, color: Colors.blue)
                  : const Icon(Icons.description_outlined, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Foreign Address",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.foreignAddress = value,
              avalible: flipProvaider.avalible,
              hintext: foreignAdress,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.house_outlined, color: Colors.blue)
                  : const Icon(Icons.house_outlined, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Foreign City",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.foreignCity = value,
              avalible: flipProvaider.avalible,
              hintext: foreignCity,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.location_city, color: Colors.blue)
                  : const Icon(Icons.location_city, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Foreign Province",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.foreignProvince = value,
              avalible: flipProvaider.avalible,
              hintext: foreignprovince,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.location_city, color: Colors.blue)
                  : const Icon(Icons.location_city, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Foreign Zip Code",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.foreignZip = value,
              avalible: flipProvaider.avalible,
              hintext: foreignZipCode,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.pin_outlined, color: Colors.blue)
                  : const Icon(Icons.pin_outlined, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Emergency Number",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.emergencyName = value,
              avalible: flipProvaider.avalible,
              hintext: emergencyName,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.phone_android, color: Colors.blue)
                  : const Icon(Icons.phone_android, color: Colors.grey),
            ),
            Container(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
