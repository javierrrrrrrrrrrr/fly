import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flip_provider.dart';
import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../imput_field.dart';

class CardBody2 extends StatelessWidget {
  const CardBody2(
      {Key? key,
      this.space,
      required this.address,
      required this.city,
      required this.state,
      required this.zipCode,
      required this.country,
      required this.nationality,
      this.spacenamed})
      : super(key: key);

//bool para controlar el espacio entre los campos
  final bool? spacenamed;

  final double? space;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String nationality;

  @override
  Widget build(BuildContext context) {
    final flipProvaider = Provider.of<FlipProvider>(context);
    final size = MediaQuery.of(context).size;
    final contactFormProvider = Provider.of<ContactFormProvider>(context);
    final contactProvider = Provider.of<ContactProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Form(
        key: contactFormProvider.formkey2,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Personal Information",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Address",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.address = value,
              avalible: flipProvaider.avalible,
              hintext: address,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.house_outlined, color: Colors.blue)
                  : const Icon(Icons.house_outlined, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "City",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.city = value,
              avalible: flipProvaider.avalible,
              hintext: city,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.location_city, color: Colors.blue)
                  : const Icon(Icons.location_city, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "State",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.state = value,
              avalible: flipProvaider.avalible,
              hintext: state,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.real_estate_agent, color: Colors.blue)
                  : const Icon(Icons.real_estate_agent, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Zip Code",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.zip = value,
              avalible: flipProvaider.avalible,
              hintext: zipCode,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.pin_outlined, color: Colors.blue)
                  : const Icon(Icons.pin_outlined, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Country",
                  ),

            Imputfield(
              onChanged: (value) =>
                  contactProvider.selectedContact!.country = value,
              avalible: flipProvaider.avalible,
              hintext: country,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.location_city_sharp, color: Colors.blue)
                  : const Icon(Icons.location_city_sharp, color: Colors.grey),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Nationality",
                  ),

            CustomDropDown(
              iconData: Icons.flag_outlined,
              contentPadding: EdgeInsets.only(left: size.width * 0.095),
              //TODO: Lenar el dropdownn con la lista de nacionalidades...
              items: const [
                'Cuban',
                'Amarican',
                'Others',
              ],
              hintext: nationality,
              onChanged: (value) => contactProvider
                  .selectedContact!.nationality = value.toString(),
              onSaved: (value) => contactProvider.selectedContact!.nationality =
                  value.toString(),
            ),
            // Imputfield(
            //   avalible: flipProvaider.avalible,
            //   hintext: "Nationality",
            //   prefixIcon: flipProvaider.avalible
            //       ? const Icon(Icons.flag_outlined, color: Colors.blue)
            //       : const Icon(Icons.flag_outlined, color: Colors.grey),
            //   suffixIcon: flipProvaider.avalible
            //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
            //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
            // ),
            Container(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
