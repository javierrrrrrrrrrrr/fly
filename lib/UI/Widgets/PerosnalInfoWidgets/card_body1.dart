import 'package:flutter/material.dart';
import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../SeparationWidget/separador.dart';
import '../imput_field.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../../../Constants/validacion.dart';
import '../../../DataLayer/Models/contact_model.dart';
import 'custom_piked_date.dart';

class CardBody1 extends StatelessWidget {
  const CardBody1({
    Key? key,
    this.space,
    required this.firstname,
    required this.lastname,
    required this.passengerType,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phone,
    this.spacenamed,
    this.selectedContact,
  }) : super(key: key);

  //bool para controlar el espacio entre los campos
  final bool? spacenamed;

  //
  final double? space;
  final String firstname;
  final String lastname;
  final String passengerType;
  final String birthDate;
  final String gender;
  final String email;
  final String phone;

  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final contactProvider = Provider.of<ContactProvider>(context);
    final contactFormProvider = Provider.of<ContactFormProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Form(
        key: contactFormProvider.formkey1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Información Personal",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Nombre",
                  ),
            _FirstNameField(
                selectedContact: selectedContact,
                contactProvider: contactProvider,
                firstname: firstname),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Apellidos",
                  ),
            _LastNameField(
                selectedContact: selectedContact,
                lastname: lastname,
                contactProvider: contactProvider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Tipo de Pasajero",
                  ),
            _PassengerTypeField(
              size: size,
              passengerType: passengerType,
              selectedContact: selectedContact,
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Fecha de nacimiento",
                  ),
            _BirthDateField(
                selectedContact: selectedContact,
                birthDate: birthDate,
                contactProvider: contactProvider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Género",
                  ),
            _GenderFIeld(
              size: size,
              gender: gender,
              selectedContact: selectedContact,
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Email",
                  ),
            _EmailField(
                selectedContact: selectedContact,
                email: email,
                contactProvider: contactProvider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Teléfono",
                  ),
            _PhoneField(
                selectedContact: selectedContact,
                phone: phone,
                contactProvider: contactProvider),
            Container(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

class _PassengerTypeField extends StatelessWidget {
  const _PassengerTypeField({
    Key? key,
    required this.size,
    required this.passengerType,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String passengerType;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    if (selectedContact == null) {
      return CustomDropDown(
        iconData: Icons.family_restroom,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        items: const [
          'Adult',
          'Child',
          'Infant',
        ],
        hintext: passengerType,
        onChanged: (value) =>
            contactProvider.selectedContact!.passengerType = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.passengerType = value.toString(),
      );
    } else {
      return CustomDropDown(
        value: selectedContact!.passengerType,
        iconData: Icons.family_restroom,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        items: const [
          'Adult',
          'Child',
          'Infant',
        ],
        hintext: passengerType,
        onChanged: (value) =>
            contactProvider.selectedContact!.passengerType = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.passengerType = value.toString(),
      );
    }
  }
}

class _GenderFIeld extends StatelessWidget {
  const _GenderFIeld({
    Key? key,
    required this.size,
    required this.gender,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String gender;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);

    if (selectedContact == null) {
      return CustomDropDown(
        iconData: Icons.man,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        items: const [
          'Male',
          'Female',
          'Other',
        ],
        hintext: gender,
        onChanged: (value) =>
            contactProvider.selectedContact!.gender = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.gender = value.toString(),
      );
    } else {
      return CustomDropDown(
          value: selectedContact!.gender,
          iconData: Icons.man,
          contentPadding: EdgeInsets.only(left: size.width * 0.095),
          items: const [
          'Male',
          'Female',
          'Other',
          ],
          hintext: gender,
          onChanged: (value) =>
              contactProvider.selectedContact!.gender = value.toString(),
          onSaved: (value) =>
              contactProvider.selectedContact!.gender = value.toString());
    }
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({
    Key? key,
    required this.selectedContact,
    required this.phone,
    required this.contactProvider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String phone;
  final ContactProvider contactProvider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.phone,
      hintext: selectedContact == null ? phone : selectedContact!.phone!,
      keyboardType: TextInputType.phone,
      onChanged: (value) => contactProvider.selectedContact!.phone = value,
      prefixIcon: const Icon(Icons.phone_android, color: Colors.blue),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    Key? key,
    required this.selectedContact,
    required this.email,
    required this.contactProvider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String email;
  final ContactProvider contactProvider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.email,
      hintext: selectedContact == null ? email : selectedContact!.email!,
      keyboardType: TextInputType.emailAddress,
      validator: mail,
      onChanged: (value) =>
          contactProvider.selectedContact!.email = value.toString(),
      prefixIcon: const Icon(Icons.contact_mail_outlined, color: Colors.blue),
    );
  }
}

class _BirthDateField extends StatelessWidget {
  const _BirthDateField({
    Key? key,
    required this.selectedContact,
    required this.birthDate,
    required this.contactProvider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String birthDate;
  final ContactProvider contactProvider;

  @override
  Widget build(BuildContext context) {
    return CustomPikedDate(
      initialvalue: selectedContact == null ? '' : selectedContact!.birthDate!,
      hintText:
          selectedContact == null ? birthDate : selectedContact!.birthDate!,
      onSelectedDate: (piked) {
        contactProvider.selectedContact!.birthDate =
            "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
      },
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField({
    Key? key,
    required this.selectedContact,
    required this.lastname,
    required this.contactProvider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String lastname;
  final ContactProvider contactProvider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.lastName,
      hintext: selectedContact == null ? lastname : selectedContact!.lastName,
      keyboardType: TextInputType.name,
      onChanged: (value) => contactProvider.selectedContact!.lastName = value,
      prefixIcon: const Icon(Icons.badge_outlined, color: Colors.blue),
    );
  }
}

class _FirstNameField extends StatelessWidget {
  const _FirstNameField({
    Key? key,
    required this.selectedContact,
    required this.contactProvider,
    required this.firstname,
  }) : super(key: key);

  final Contact? selectedContact;
  final ContactProvider contactProvider;
  final String firstname;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
        initialValue: selectedContact == null ? '' : selectedContact!.firstName,
        keyboardType: TextInputType.name,
        onChanged: (value) =>
            contactProvider.selectedContact!.firstName = value,
        hintext:
            selectedContact == null ? firstname : selectedContact!.firstName,
        prefixIcon: const Icon(Icons.badge_outlined, color: Colors.blue));
  }
}
