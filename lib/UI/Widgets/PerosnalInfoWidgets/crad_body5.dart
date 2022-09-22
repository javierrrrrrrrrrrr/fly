import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/custom_piked_date.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imput_field.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/user_provider.dart';
import '../CustomWidget/custom_dropdown.dart';

class CardBody5 extends StatelessWidget {
  const CardBody5(
      {Key? key,
      this.space,
      required this.expDate,
      required this.passportNumbersec,
      required this.contryOfIssuesec,
      required this.arrivalDocNumbersec,
      required this.expDatesec,
      this.spacenamed})
      : super(key: key);

  final double? space;

  //bool para controlar el espacio entre los campos
  final bool? spacenamed;

  final String expDate;
  final String passportNumbersec;
  final String contryOfIssuesec;
  final String arrivalDocNumbersec;
  final String expDatesec;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    final personalInfoProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  texto: "Expiration Date",
                ),

          CustomPikedDate(
            //TODO : mandar por parametros en icono del campo
            hintText: expDate,
            onSelectedDate: (piked) {
              personalInfoProvider.primaryExpDate =
                  "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
            },
          ),
          // Imputfield(
          //   avalible: flipProvaider.avalible,
          //   suffixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.calendar_month, color: Colors.blue)
          //       : const Icon(Icons.calendar_month, color: Colors.grey),
          //   hintext: "Exp Date",
          //   prefixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.article_outlined, color: Colors.blue)
          //       : const Icon(Icons.article_outlined, color: Colors.grey),
          // ),

          Separador(
            space: space,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Secondary Documents",
              style: TextStyle(fontSize: 25),
            ),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Passport Number",
                ),

          CustomDropDown(
            iconData: Icons.import_contacts_outlined,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de ddocument  here...
            items: const [
              'Document 1',
              'Document 2',
              'Document 3',
            ],
            hintext: passportNumbersec,
            onChanged: (value) =>
                personalInfoProvider.passport = value.toString(),
            onSaved: (value) =>
                personalInfoProvider.passport = value.toString(),
          ),
          // Imputfield(
          //   avalible: flipProvaider.avalible,
          //   suffixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
          //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
          //   hintext: "Passport",
          //   prefixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.import_contacts_outlined, color: Colors.blue)
          //       : const Icon(Icons.import_contacts_outlined,
          //           color: Colors.grey),
          // ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Country of Issue",
                ),

          CustomDropDown(
            iconData: Icons.flag_outlined,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de ddocument  here...
            items: const [
              'Document 1',
              'Document 2',
              'Document 3',
            ],
            hintext: contryOfIssuesec,
            onChanged: (value) =>
                personalInfoProvider.countryOfIssue = value.toString(),
            onSaved: (value) =>
                personalInfoProvider.countryOfIssue = value.toString(),
          ),
          // Imputfield(
          //   avalible: flipProvaider.avalible,
          //   suffixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
          //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
          //   hintext: "Country of Issue",
          //   prefixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.flag_outlined, color: Colors.blue)
          //       : const Icon(Icons.flag_outlined, color: Colors.grey),
          // ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Arrival Document Number",
                ),

          Imputfield(
            onChanged: (value) =>
                personalInfoProvider.secundaryArrivalDocNo = value,
            avalible: flipProvaider.avalible,
            hintext: arrivalDocNumbersec,
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.flight_land, color: Colors.blue)
                : const Icon(Icons.flight_land, color: Colors.grey),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Expiration Date",
                ),

          CustomPikedDate(
            //TODO : mandar por parametros en icono del campo
            hintText: expDatesec,
            onSelectedDate: (piked) {
              personalInfoProvider.secundaryExpDate =
                  "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
            },
          ),
          //  Imputfield(
          //    avalible: flipProvaider.avalible,
          //    suffixIcon: flipProvaider.avalible
          //        ? const Icon(Icons.calendar_month, color: Colors.blue)
          //        : const Icon(Icons.calendar_month, color: Colors.grey),
          //    hintext: "Exp Date",
          //    prefixIcon: flipProvaider.avalible
          //        ? const Icon(Icons.article_outlined, color: Colors.blue)
          //        : const Icon(Icons.article_outlined, color: Colors.grey),
          //  ),
          const Separador(),
          Container(
            height: size.height * 0.06,
          ),
        ],
      ),
    );
  }
}
