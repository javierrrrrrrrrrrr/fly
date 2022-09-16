import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/personal_info_provider.dart';
import 'package:fly_cliente/UI/Widgets/CustomWidget/custom_dropdown.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imput_field.dart';
import 'package:provider/provider.dart';

import 'custom_piked_date.dart';

class CradBody1 extends StatelessWidget {
  const CradBody1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final personalInfoProvider = Provider.of<PersonalInfoProvider>(context);
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
          const Separador(),
          Imputfield(
              onChanged: (value) => personalInfoProvider.fistName,
              hintext: "First Name",
              prefixIcon: const Icon(Icons.badge_outlined, color: Colors.blue)),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.lastName,
            hintext: "Last Name",
            prefixIcon: const Icon(Icons.badge_outlined, color: Colors.blue),
          ),
          const Separador(),
          CustomDropDown(
            iconData: Icons.family_restroom,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            items: const [
              'Adult',
              'Child',
              'Infant',
            ],
            hintext: 'Passenger Typer',
            onChanged: (value) =>
                personalInfoProvider.passengerType = value.toString(),
            onSaved: (value) =>
                personalInfoProvider.passengerType = value.toString(),
          ),
          const Separador(),
          CustomPikedDate(
            hintText: 'Birth Date',
            onSelectedDate: (piked) {
              personalInfoProvider.birthDate =
                  "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
            },
          ),
          const Separador(),
          CustomDropDown(
            iconData: Icons.man,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            items: const [
              'Male',
              'Female',
              'Other',
            ],
            hintext: 'Gender',
            onChanged: (value) =>
                personalInfoProvider.gender = value.toString(),
            onSaved: (value) => personalInfoProvider.gender = value.toString(),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.email = value.toString(),
            hintext: "Email",
            prefixIcon:
                const Icon(Icons.contact_mail_outlined, color: Colors.blue),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.phone = value.toString(),
            hintext: "Phone",
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
