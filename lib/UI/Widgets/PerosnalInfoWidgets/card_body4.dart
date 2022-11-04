import 'package:flutter/material.dart';
import '../../../Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../../../DataLayer/Models/contact_model.dart';
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
      this.spacenamed,
      this.selectedContact})
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
        key: contactFormProvider.formkey4,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Información de Vuelo",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(space: space, texto: "Teléfono de Emergencia"),
            _EmergencyNumberField(
                selectedContact: selectedContact,
                emergencyPhone: emergencyPhone,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(space: space, texto: "Primer Nombre Cubano"),
            _CubanFirstNameField(
                selectedContact: selectedContact,
                cubanFirstName: cubanFirstName,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(space: space, texto: "Apellido Cubano"),
            _CubanLastNameField(
                selectedContact: selectedContact,
                cubanLastName: cubanLastName,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Documentos Primarios",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(space: space, texto: "Documentos de Llegada"),
            _ArrivalDocumentsField(
                size: size,
                arrivalDocs: arrivalDocs,
                selectedContact: selectedContact),
            spacenamed == false
                ? const Separador()
                : Separador(space: space, texto: "País en Cuentión"),
            _CountryIssue(
              arrivalDocs: arrivalDocs,
              size: size,
              selectedContact: selectedContact,
            ),
            spacenamed == false
                ? const Separador()
                : Separador(space: space, texto: "Documentos de Llegada No"),
            _ArrivalDocNOField(
                selectedContact: selectedContact,
                arrivalDocNo: arrivalDocNo,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            Container(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

class _ArrivalDocNOField extends StatelessWidget {
  const _ArrivalDocNOField({
    Key? key,
    required this.selectedContact,
    required this.arrivalDocNo,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String arrivalDocNo;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue:
          selectedContact == null ? '' : selectedContact!.arrivalDocNo,
      hintext: selectedContact == null
          ? arrivalDocNo
          : selectedContact!.arrivalDocNo!,
      onChanged: (value) =>
          contactProvider.selectedContact!.arrivalDocNo = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.flight_land, color: Colors.blue)
          : const Icon(Icons.flight_land, color: Colors.grey),
    );
  }
}

class _ArrivalDocumentsField extends StatelessWidget {
  const _ArrivalDocumentsField({
    Key? key,
    required this.size,
    required this.arrivalDocs,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String arrivalDocs;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    if (selectedContact == null) {
      return CustomDropDown(
        iconData: Icons.flight_land,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        //TODO: Lenar el dropdownn con la lista de ddocument  here...
        items: const [
          'Pasaporte',
          'Visa',
          'Permanent Resident Card',
          'ID',
          'Alient Resident Card',
        ],
        hintext: arrivalDocs,
        onChanged: (value) =>
            contactProvider.selectedContact!.arrivalDoc = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.arrivalDoc = value.toString(),
      );
    } else {
      return CustomDropDown(
        value: selectedContact!.arrivalDoc!,
        iconData: Icons.flight_land,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        //TODO: Lenar el dropdownn con la lista de ddocument  here...
        items: const [
          'Pasaporte',
          'Visa',
          'Permanent Resident Card',
          'ID',
          'Alient Resident Card',
        ],
        hintext: arrivalDocs,
        onChanged: (value) =>
            contactProvider.selectedContact!.arrivalDoc = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.arrivalDoc = value.toString(),
      );
    }
  }
}

class _CountryIssue extends StatelessWidget {
  const _CountryIssue({
    Key? key,
    required this.size,
    required this.arrivalDocs,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String arrivalDocs;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    if (selectedContact == null) {
      return CustomDropDown(
        iconData: Icons.flag_outlined,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        //TODO: Lenar el dropdownn con la lista de countrys  here...
        items: contactProvider.countryNames,
        hintext: arrivalDocs,
        onChanged: (value) =>
            contactProvider.selectedContact!.countryOfIssue = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.countryOfIssue = value.toString(),
      );
    } else {
      return CustomDropDown(
        value: selectedContact!.countryOfIssue!,
        iconData: Icons.flag_outlined,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        //TODO: Lenar el dropdownn con la lista de ddocument  here...
        items: contactProvider.countryNames,
        hintext: arrivalDocs,
        onChanged: (value) =>
            contactProvider.selectedContact!.countryOfIssue = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.countryOfIssue = value.toString(),
      );
    }
  }
}

class _CubanLastNameField extends StatelessWidget {
  const _CubanLastNameField({
    Key? key,
    required this.selectedContact,
    required this.cubanLastName,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String cubanLastName;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue:
          selectedContact == null ? '' : selectedContact!.cubanLastName,
      hintext: selectedContact == null
          ? cubanLastName
          : selectedContact!.cubanLastName!,
      onChanged: (value) =>
          contactProvider.selectedContact!.cubanLastName = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.badge_outlined, color: Colors.blue)
          : const Icon(Icons.badge_outlined, color: Colors.grey),
    );
  }
}

class _CubanFirstNameField extends StatelessWidget {
  const _CubanFirstNameField({
    Key? key,
    required this.selectedContact,
    required this.cubanFirstName,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String cubanFirstName;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
        initialValue:
            selectedContact == null ? '' : selectedContact!.cubanFirstName,
        hintext: selectedContact == null
            ? cubanFirstName
            : selectedContact!.cubanFirstName!,
        onChanged: (value) =>
            contactProvider.selectedContact!.cubanFirstName = value,
        avalible: flipProvaider.avalible,
        prefixIcon: flipProvaider.avalible
            ? const Icon(Icons.badge_outlined, color: Colors.blue)
            : const Icon(Icons.badge_outlined, color: Colors.grey));
  }
}

class _EmergencyNumberField extends StatelessWidget {
  const _EmergencyNumberField({
    Key? key,
    required this.selectedContact,
    required this.emergencyPhone,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String emergencyPhone;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue:
          selectedContact == null ? '' : selectedContact!.emergencyPhone,
      hintext: selectedContact == null
          ? emergencyPhone
          : selectedContact!.emergencyPhone!,
      keyboardType: TextInputType.phone,
      onChanged: (value) =>
          contactProvider.selectedContact!.emergencyPhone = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.phone_android_outlined, color: Colors.blue)
          : const Icon(Icons.phone_android_outlined, color: Colors.grey),
    );
  }
}
