import 'package:flutter/material.dart';

import '../SeparationWidget/separador.dart';
import '../imputField.dart';

class CradBody4 extends StatelessWidget {
  const CradBody4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Flight Information",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Emergency phone",
            prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Cuban First Name",
            prefixIcon: Icon(Icons.description_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Cuban Last Name",
            prefixIcon: Icon(Icons.house_outlined, color: Colors.blue),
          ),
          const Separador(),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Primary Documents",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          const Imputfield(
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
            hintext: "Arrival Doc",
            prefixIcon: Icon(Icons.location_city, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
            hintext: "Country Issuse",
            prefixIcon: Icon(Icons.folder_zip_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Arrival Doc No",
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
