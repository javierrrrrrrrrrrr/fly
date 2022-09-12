import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imputField.dart';

class CradBody1 extends StatelessWidget {
  const CradBody1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          const Imputfield(
              hintext: "First Name",
              prefixIcon: Icon(Icons.badge_outlined, color: Colors.blue)),
          const Separador(),
          const Imputfield(
            hintext: "Last Name",
            prefixIcon: Icon(Icons.badge_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Passenger Type",
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
            prefixIcon: Icon(Icons.family_restroom, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            suffixIcon: Icon(Icons.calendar_month, color: Colors.blue),
            hintext: "Birth Date",
            prefixIcon: Icon(Icons.cake, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Gender",
            prefixIcon: Icon(Icons.man, color: Colors.blue),
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Email",
            prefixIcon: Icon(Icons.contact_mail_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Phone",
            prefixIcon: Icon(Icons.phone_android, color: Colors.blue),
          ),
          Container(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
