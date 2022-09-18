import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/personal_info_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../SeparationWidget/separador.dart';
import '../imput_field.dart';

class CardBody4 extends StatelessWidget {
  const CardBody4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    final personalInfoProvider = Provider.of<PersonalInfoProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.emergencyphone = value,
            avalible: flipProvaider.avalible,
            hintext: "Emergency phone",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.phone_android_outlined, color: Colors.blue)
                : const Icon(Icons.phone_android_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
              onChanged: (value) => personalInfoProvider.cubanFirstName = value,
              avalible: flipProvaider.avalible,
              hintext: "Cuban First Name",
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.badge_outlined, color: Colors.blue)
                  : const Icon(Icons.badge_outlined, color: Colors.grey)),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.cubanLastName = value,
            avalible: flipProvaider.avalible,
            hintext: "Cuban Last Name",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.badge_outlined, color: Colors.blue)
                : const Icon(Icons.badge_outlined, color: Colors.grey),
          ),
          const Separador(),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Primary Documents",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          CustomDropDown(
            iconData: Icons.flight_land,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de ddocument  here...
            items: const [
              'Document 1',
              'Document 2',
              'Document 3',
            ],
            hintext: 'Arrival Docs',
            onChanged: (value) =>
                personalInfoProvider.arrivalDoc = value.toString(),
            onSaved: (value) =>
                personalInfoProvider.arrivalDoc = value.toString(),
          ),
          // Imputfield(

          //   avalible: flipProvaider.avalible,
          //   suffixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
          //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
          //   hintext: "Arrival Doc",
          //   prefixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.flight_land, color: Colors.blue)
          //       : const Icon(Icons.flight_land, color: Colors.grey),
          // ),
          const Separador(),
          CustomDropDown(
            iconData: Icons.flag_outlined,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de countrys  here...
            items: const [
              'Country 1',
              'Country 2',
              'Country 3',
            ],
            hintext: 'Country Issue',
            onChanged: (value) =>
                personalInfoProvider.countryIssue = value.toString(),
            onSaved: (value) =>
                personalInfoProvider.countryIssue = value.toString(),
          ),
          // Imputfield(
          //   avalible: flipProvaider.avalible,
          //   suffixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
          //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
          //   hintext: "Country Issuse",
          //   prefixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.flag_outlined, color: Colors.blue)
          //       : const Icon(Icons.flag_outlined, color: Colors.grey),
          // ),
          const Separador(),
          Imputfield(
            onChanged: (value) =>
                personalInfoProvider.primaryArrivalDocNo = value,
            avalible: flipProvaider.avalible,
            hintext: "Arrival Doc No",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.flight_land, color: Colors.blue)
                : const Icon(Icons.flight_land, color: Colors.grey),
          ),
          Container(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
