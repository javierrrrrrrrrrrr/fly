import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/user_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../SeparationWidget/separador.dart';
import '../imput_field.dart';

class CardBody4 extends StatelessWidget {
  const CardBody4(
      {Key? key,
      this.space,
      required this.emergencyPhone,
      required this.cubanFirstName,
      required this.cubanLastName,
      required this.arrivalDocs,
      required this.countryIssue,
      required this.arrivalDocNo,
      this.spacenamed})
      : super(key: key);

  final double? space;
  //bool para controlar el espacio entre los campos
  final bool? spacenamed;

  final String emergencyPhone;
  final String cubanFirstName;
  final String cubanLastName;
  final String arrivalDocs;
  final String countryIssue;
  final String arrivalDocNo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    final personalInfoProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
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
                  texto: "Emergency Phone",
                ),

          Imputfield(
            onChanged: (value) => personalInfoProvider.emergencyphone = value,
            avalible: flipProvaider.avalible,
            hintext: emergencyPhone,
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.phone_android_outlined, color: Colors.blue)
                : const Icon(Icons.phone_android_outlined, color: Colors.grey),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Cuban First Name",
                ),

          Imputfield(
              onChanged: (value) => personalInfoProvider.cubanFirstName = value,
              avalible: flipProvaider.avalible,
              hintext: cubanFirstName,
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.badge_outlined, color: Colors.blue)
                  : const Icon(Icons.badge_outlined, color: Colors.grey)),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Cuban Last Name",
                ),

          Imputfield(
            onChanged: (value) => personalInfoProvider.cubanLastName = value,
            avalible: flipProvaider.avalible,
            hintext: cubanLastName,
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.badge_outlined, color: Colors.blue)
                : const Icon(Icons.badge_outlined, color: Colors.grey),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Arrival Docs",
                ),

          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Primary Documents",
              style: TextStyle(fontSize: 25),
            ),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Arrival Docs",
                ),

          CustomDropDown(
            iconData: Icons.flight_land,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de ddocument  here...
            items: const [
              'Document 1',
              'Document 2',
              'Document 3',
            ],
            hintext: arrivalDocs,
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
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Country Issue",
                ),

          CustomDropDown(
            iconData: Icons.flag_outlined,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de countrys  here...
            items: const [
              'Country 1',
              'Country 2',
              'Country 3',
            ],
            hintext: countryIssue,
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
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Arrival Doc No",
                ),

          Imputfield(
            onChanged: (value) =>
                personalInfoProvider.primaryArrivalDocNo = value,
            avalible: flipProvaider.avalible,
            hintext: arrivalDocNo,
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
