import 'package:flutter/material.dart';
import '../../../Business_logic/Provaiders/flip_provider.dart';
import 'custom_piked_date.dart';
import '../imput_field.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../../../DataLayer/Models/contact_model.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../SeparationWidget/separador.dart';

class CardBody5 extends StatelessWidget {
  const CardBody5({
    Key? key,
    this.space,
    required this.expDate,
    required this.passportNumbersec,
    required this.contryOfIssuesec,
    required this.arrivalDocNumbersec,
    required this.expDatesec,
    this.spacenamed,
    this.selectedContact,
  }) : super(key: key);

  final double? space;

  //bool para controlar el espacio entre los campos
  final bool? spacenamed;

  final String expDate;
  final String passportNumbersec;
  final String contryOfIssuesec;
  final String arrivalDocNumbersec;
  final String expDatesec;
  final Contact? selectedContact;

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
                "Documentos Primarios",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Fecha de Vencimiento",
                  ),

            _ExpDateField(
                selectedContact: selectedContact,
                expDate: expDate,
                contactProvider: contactProvider),

            Separador(
              space: space,
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Documentos Secundarios",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Número de Pasaporte",
                  ),

            _PassportNumberSecField(
                size: size,
                passportNumbersec: passportNumbersec,
                selectedContact: selectedContact),

            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "País en Cuentión",
                  ),

            _CountryOfIssueSecField(
                size: size,
                contryOfIssuesec: contryOfIssuesec,
                selectedContact: selectedContact),

            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Número de Documentos de LLegada",
                  ),

            _ArrivalDocNumberSecField(selectedContact: selectedContact, arrivalDocNumbersec: arrivalDocNumbersec, contactProvider: contactProvider, flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Fecha de Vencimiento",
                  ),

            _ExpDateSecField(selectedContact: selectedContact, expDatesec: expDatesec, contactProvider: contactProvider),
       
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

class _ExpDateSecField extends StatelessWidget {
  const _ExpDateSecField({
    Key? key,
    required this.selectedContact,
    required this.expDatesec,
    required this.contactProvider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String expDatesec;
  final ContactProvider contactProvider;

  @override
  Widget build(BuildContext context) {
    return CustomPikedDate(
       initialvalue: selectedContact == null ? '' : selectedContact!.expDateSec!,
      //TODO : mandar por parametros en icono del campo
      hintText: expDatesec,
      onSelectedDate: (piked) {
        contactProvider.selectedContact!.expDateSec =
            "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
      },
    );
  }
}

class _ArrivalDocNumberSecField extends StatelessWidget {
  const _ArrivalDocNumberSecField({
    Key? key,
    required this.selectedContact,
    required this.arrivalDocNumbersec,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String arrivalDocNumbersec;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null
          ? ''
          : selectedContact!.arrivalDocNoSec!,
      hintext: selectedContact == null
          ? arrivalDocNumbersec
          : selectedContact!.arrivalDocNoSec!,
      onChanged: (value) =>
          contactProvider.selectedContact!.arrivalDocNoSec = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.flight_land, color: Colors.blue)
          : const Icon(Icons.flight_land, color: Colors.grey),
    );
  }
}

class _CountryOfIssueSecField extends StatelessWidget {
  const _CountryOfIssueSecField({
    Key? key,
    required this.size,
    required this.contryOfIssuesec,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String contryOfIssuesec;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    if (selectedContact == null) {
      return CustomDropDown(
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
        onSaved: (value) => contactProvider.selectedContact!.countryOfIssueSec =
            value.toString(),
      );
    } else {
      return CustomDropDown(
        value: selectedContact!.countryOfIssueSec!,
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
        onSaved: (value) => contactProvider.selectedContact!.countryOfIssueSec =
            value.toString(),
      );
    }
  }
}

class _PassportNumberSecField extends StatelessWidget {
  const _PassportNumberSecField({
    Key? key,
    required this.size,
    required this.passportNumbersec,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String passportNumbersec;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    if (selectedContact == null) {
      return CustomDropDown(
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
        onSaved: (value) => contactProvider.selectedContact!.passportNumberSec =
            value.toString(),
      );
    } else {
      return CustomDropDown(
        value: selectedContact!.passportNumberSec!,
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
        onSaved: (value) => contactProvider.selectedContact!.passportNumberSec =
            value.toString(),
      );
    }
  }
}

class _ExpDateField extends StatelessWidget {
  const _ExpDateField({
    Key? key,
    required this.selectedContact,
    required this.expDate,
    required this.contactProvider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String expDate;
  final ContactProvider contactProvider;

  @override
  Widget build(BuildContext context) {
    return CustomPikedDate(
      //TODO : mandar por parametros en icono del campo
      initialvalue: selectedContact == null ? '' : selectedContact!.expDate!,
      hintText: expDate,
      onSelectedDate: (piked) {
        contactProvider.selectedContact!.expDate =
            "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
      },
    );
  }
}
