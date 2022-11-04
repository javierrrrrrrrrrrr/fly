import 'package:flutter/material.dart';
import '../SeparationWidget/separador.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flip_provider.dart';
import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../../../DataLayer/Models/contact_model.dart';
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
      this.spacenamed,
      this.selectedContact})
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

  final Contact? selectedContact;

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
                "Información Personal",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Dirección",
                  ),
            _AddressField(
                selectedContact: selectedContact,
                address: address,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Ciudad",
                  ),
            _CityField(
                selectedContact: selectedContact,
                city: city,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Estado",
                  ),
            _Statefield(
                selectedContact: selectedContact,
                state: state,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Código Postal",
                  ),
            _ZipCodeField(
                selectedContact: selectedContact,
                zipCode: zipCode,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "País",
                  ),
            _CountryField(
                selectedContact: selectedContact,
                country: country,
                contactProvider: contactProvider,
                flipProvaider: flipProvaider),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Nacionalidad",
                  ),
            _NationalityField(
              size: size,
              nationality: nationality,
              selectedContact: selectedContact,
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

class _NationalityField extends StatelessWidget {
  const _NationalityField({
    Key? key,
    required this.size,
    required this.nationality,
    this.selectedContact,
  }) : super(key: key);

  final Size size;
  final String nationality;
  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    if (selectedContact == null) {
      return CustomDropDown(
        iconData: Icons.flag_outlined,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        //TODO: Lenar el dropdownn con la lista de nacionalidades...
        items: contactProvider.countryNames,
        hintext: nationality,
        onChanged: (value) =>
            contactProvider.selectedContact!.nationality = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.nationality = value.toString(),
      );
    } else {
      return CustomDropDown(
        value: selectedContact!.nationality!,
        iconData: Icons.flag_outlined,
        contentPadding: EdgeInsets.only(left: size.width * 0.095),
        //TODO: Lenar el dropdownn con la lista de nacionalidades...
        items: contactProvider.countryNames,
        hintext: nationality,
        onChanged: (value) =>
            contactProvider.selectedContact!.nationality = value.toString(),
        onSaved: (value) =>
            contactProvider.selectedContact!.nationality = value.toString(),
      );
    }
  }
}

class _CountryField extends StatelessWidget {
  const _CountryField({
    Key? key,
    required this.selectedContact,
    required this.country,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String country;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.country,
      hintext: selectedContact == null ? country : selectedContact!.country!,
      onChanged: (value) => contactProvider.selectedContact!.country = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.location_city_sharp, color: Colors.blue)
          : const Icon(Icons.location_city_sharp, color: Colors.grey),
    );
  }
}

class _ZipCodeField extends StatelessWidget {
  const _ZipCodeField({
    Key? key,
    required this.selectedContact,
    required this.zipCode,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String zipCode;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.zip,
      hintext: selectedContact == null ? zipCode : selectedContact!.zip!,
      onChanged: (value) => contactProvider.selectedContact!.zip = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.pin_outlined, color: Colors.blue)
          : const Icon(Icons.pin_outlined, color: Colors.grey),
    );
  }
}

class _Statefield extends StatelessWidget {
  const _Statefield({
    Key? key,
    required this.selectedContact,
    required this.state,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String state;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.state,
      hintext: selectedContact == null ? state : selectedContact!.state!,
      onChanged: (value) => contactProvider.selectedContact!.state = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.real_estate_agent, color: Colors.blue)
          : const Icon(Icons.real_estate_agent, color: Colors.grey),
    );
  }
}

class _CityField extends StatelessWidget {
  const _CityField({
    Key? key,
    required this.selectedContact,
    required this.city,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String city;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.city,
      hintext: selectedContact == null ? city : selectedContact!.city!,
      onChanged: (value) => contactProvider.selectedContact!.city = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.location_city, color: Colors.blue)
          : const Icon(Icons.location_city, color: Colors.grey),
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField({
    Key? key,
    required this.selectedContact,
    required this.address,
    required this.contactProvider,
    required this.flipProvaider,
  }) : super(key: key);

  final Contact? selectedContact;
  final String address;
  final ContactProvider contactProvider;
  final FlipProvider flipProvaider;

  @override
  Widget build(BuildContext context) {
    return Imputfield(
      initialValue: selectedContact == null ? '' : selectedContact!.address,
      hintext: selectedContact == null ? address : selectedContact!.address!,
      keyboardType: TextInputType.streetAddress,
      onChanged: (value) => contactProvider.selectedContact!.address = value,
      avalible: flipProvaider.avalible,
      prefixIcon: flipProvaider.avalible
          ? const Icon(Icons.house_outlined, color: Colors.blue)
          : const Icon(Icons.house_outlined, color: Colors.grey),
    );
  }
}
