import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/user_provider.dart';
import 'package:fly_cliente/UI/Widgets/CustomWidget/custom_dropdown.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imput_field.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userprovider = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
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
                  texto: "First Name",
                ),
          Imputfield(
              onChanged: (value) => userprovider.fistName = value,
              hintext: firstname,
              prefixIcon: const Icon(Icons.badge_outlined, color: Colors.blue)),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Last Name",
                ),
          Imputfield(
            onChanged: (value) => userprovider.lastName = value,
            hintext: lastname,
            prefixIcon: const Icon(Icons.badge_outlined, color: Colors.blue),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Passenger Type",
                ),
          CustomDropDown(
            iconData: Icons.family_restroom,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            items: const [
              'Adult',
              'Child',
              'Infant',
            ],
            hintext: passengerType,
            onChanged: (value) => userprovider.passengerType = value.toString(),
            onSaved: (value) => userprovider.passengerType = value.toString(),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Birth Date",
                ),
          CustomPikedDate(
            hintText: birthDate,
            onSelectedDate: (piked) {
              userprovider.birthDate =
                  "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
              print(userprovider.birthDate.toString());
            },
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Gender",
                ),
          CustomDropDown(
            iconData: Icons.man,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            items: const [
              'Male',
              'Female',
              'Other',
            ],
            hintext: gender,
            onChanged: (value) => userprovider.gender = value.toString(),
            onSaved: (value) => userprovider.gender = value.toString(),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Email",
                ),
          Imputfield(
            onChanged: (value) => userprovider.email = value.toString(),
            hintext: email,
            prefixIcon:
                const Icon(Icons.contact_mail_outlined, color: Colors.blue),
          ),
          spacenamed == false
              ? const Separador()
              : Separador(
                  space: space,
                  texto: "Phone",
                ),
          Imputfield(
            onChanged: (value) => userprovider.phone = value,
            hintext: phone,
            prefixIcon: const Icon(Icons.phone_android, color: Colors.blue),
          ),
          Container(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
