import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/custom_piked_date.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imput_field.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
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
    final contactProvider = Provider.of<ContactProvider>(context);
    final contactFormProvider = Provider.of<ContactFormProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Form(
        key: contactFormProvider.formkey5,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                contactProvider.selectedContact!.expDate =
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
              onChanged: (value) => contactProvider
                  .selectedContact!.passportNumberSec = value.toString(),
              onSaved: (value) => contactProvider
                  .selectedContact!.passportNumberSec = value.toString(),
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
              onChanged: (value) => contactProvider
                  .selectedContact!.countryOfIssueSec = value.toString(),
              onSaved: (value) => contactProvider
                  .selectedContact!.countryOfIssueSec = value.toString(),
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
                  contactProvider.selectedContact!.arrivalDocNoSec = value,
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
                contactProvider.selectedContact!.expDateSec =
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
      ),
    );
  }
}
