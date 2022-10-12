import 'package:flutter/material.dart';
import '../../../Business_logic/Provaiders/flip_provider.dart';
import '../../../DataLayer/Models/contact_model.dart';
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
      required this.foreignProvince,
      required this.foreignZipCode,
      required this.emergencyName,
      this.spacenamed,
      this.selectedContact})
      : super(key: key);

  final double? space;

  //bool para controlar el espacio entre los campos
  final bool? spacenamed;

  final String ofacCode;
  final String motherMaiden;
  final String foreignAdress;
  final String foreignCity;
  final String foreignProvince;
  final String foreignZipCode;
  final String emergencyName;
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
        key: contactFormProvider.formkey3,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Información del vuelo",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "OFAC Código",
                  ),
            _OfacCodeField(
                size: size,
                ofacCode: ofacCode,
                selectedContact: selectedContact),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Nombre de Soltera",
                  ),
            _MotherMaidenField(
                contactProvider: contactProvider,
                flipProvaider: flipProvaider,
                motherMaiden: motherMaiden,
                selectedContact: selectedContact),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Dirección Extranjera",
                  ),
            _ForeingAddressField(
                selectedContact: selectedContact,
                foreignAdress: foreignAdress,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Cuidad Extranjera",
                  ),
            _ForeingCityField(
                selectedContact: selectedContact,
                foreignCity: foreignCity,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Provincia Extranjera",
                  ),
            _ForeingProvinceField(
                selectedContact: selectedContact,
                foreignProvince: foreignProvince,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Código Postal Extranjero",
                  ),
            _ForeingZipCodeField(
                selectedContact: selectedContact,
                foreignZipCode: foreignZipCode,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Número de Emergencia",
                  ),
            _EmergencyNameField(
                selectedContact: selectedContact,
                emergencyName: emergencyName,
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

class _EmergencyNameField extends StatelessWidget {
  const _EmergencyNameField({
    Key? key,
    required this.selectedContact,
    required this.emergencyName,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String emergencyName;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue:
          selectedContact == null ? '' : selectedContact!.emergencyName,
      hintext: selectedContact == null
          ? emergencyName
          : selectedContact!.emergencyName!,
      keyboardType: TextInputType.phone,
      onChanged: (value) =>
          contactProvider.selectedContact!.emergencyName = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.phone_android, color: Colors.blue)
          : const Icon(Icons.phone_android, color: Colors.grey),
    );
  }
}

class _ForeingZipCodeField extends StatelessWidget {
  const _ForeingZipCodeField({
    Key? key,
    required this.selectedContact,
    required this.foreignZipCode,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String foreignZipCode;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.foreignZip,
      hintext: selectedContact == null
          ? foreignZipCode
          : selectedContact!.foreignZip!,
      onChanged: (value) => contactProvider.selectedContact!.foreignZip = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.pin_outlined, color: Colors.blue)
          : const Icon(Icons.pin_outlined, color: Colors.grey),
    );
  }
}

class _ForeingProvinceField extends StatelessWidget {
  const _ForeingProvinceField({
    Key? key,
    required this.selectedContact,
    required this.foreignProvince,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String foreignProvince;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue:
          selectedContact == null ? '' : selectedContact!.foreignProvince,
      hintext: selectedContact == null
          ? foreignProvince
          : selectedContact!.foreignProvince!,
      onChanged: (value) =>
          contactProvider.selectedContact!.foreignProvince = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.location_city, color: Colors.blue)
          : const Icon(Icons.location_city, color: Colors.grey),
    );
  }
}

class _ForeingCityField extends StatelessWidget {
  const _ForeingCityField({
    Key? key,
    required this.selectedContact,
    required this.foreignCity,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String foreignCity;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.foreignCity,
      hintext:
          selectedContact == null ? foreignCity : selectedContact!.foreignCity!,
      onChanged: (value) =>
          contactProvider.selectedContact!.foreignCity = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.location_city, color: Colors.blue)
          : const Icon(Icons.location_city, color: Colors.grey),
    );
  }
}

class _ForeingAddressField extends StatelessWidget {
  const _ForeingAddressField({
    Key? key,
    required this.selectedContact,
    required this.foreignAdress,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String foreignAdress;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue:
          selectedContact == null ? '' : selectedContact!.foreignAddress,
      hintext: selectedContact == null
          ? foreignAdress
          : selectedContact!.foreignAddress!,
      onChanged: (value) =>
          contactProvider.selectedContact!.foreignAddress = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.house_outlined, color: Colors.blue)
          : const Icon(Icons.house_outlined, color: Colors.grey),
    );
  }
}

class _MotherMaidenField extends StatelessWidget {
  const _MotherMaidenField({
    Key? key,
    required this.contactProvider,
    required this.flipProvaider,
    required this.motherMaiden,
    this.selectedContact,
  }) : super(key: key);

  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;
  final String motherMaiden;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue:
          selectedContact == null ? '' : selectedContact!.mothersMaiden,
      hintext: selectedContact == null
          ? motherMaiden
          : selectedContact!.mothersMaiden!,
      keyboardType: TextInputType.name,
      onChanged: (value) =>
          contactProvider.selectedContact!.mothersMaiden = value,
      prefixIcon: const Icon(Icons.description_outlined, color: Colors.blue),
    );
  }
}

class _OfacCodeField extends StatelessWidget {
  const _OfacCodeField({
    Key? key,
    required this.size,
    required this.ofacCode,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String ofacCode;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    if (selectedContact == null) {
      return CustomDropDown(
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
      );
    } else {
      return CustomDropDown(
        value: selectedContact!.ofacCode!,
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
      );
    }
  }
}
