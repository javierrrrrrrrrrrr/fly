import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';

import '../imputField.dart';

class CradBody2 extends StatelessWidget {
  const CradBody2({Key? key}) : super(key: key);

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
              "Personal Information",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Address",
            prefixIcon: Icon(Icons.house_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "City",
            prefixIcon: Icon(Icons.location_city, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "State",
            prefixIcon: Icon(Icons.clean_hands, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Zip",
            prefixIcon: Icon(Icons.folder_zip, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Country",
            prefixIcon: Icon(Icons.location_city_sharp, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Nationality",
            prefixIcon: Icon(Icons.flag_outlined, color: Colors.blue),
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
          ),
          const Separador(),
        ],
      ),
    );
  }
}
