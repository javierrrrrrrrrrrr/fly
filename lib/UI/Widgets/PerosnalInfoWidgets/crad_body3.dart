import 'package:flutter/material.dart';

import '../SeparationWidget/separador.dart';
import '../imputField.dart';

class CradBody3 extends StatelessWidget {
  const CradBody3({Key? key}) : super(key: key);
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
            hintext: "Ofac Code",
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
            prefixIcon: Icon(Icons.description_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Mothers Maiden",
            prefixIcon: Icon(Icons.description_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Foreign Address",
            prefixIcon: Icon(Icons.house_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Foreign City",
            prefixIcon: Icon(Icons.location_city, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Foreign Province",
            prefixIcon: Icon(Icons.location_city, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Foreign Zip",
            prefixIcon: Icon(Icons.folder_zip_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Emergency Name",
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
