import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flipProvider.dart';
import 'package:provider/provider.dart';

import '../SeparationWidget/separador.dart';
import '../imputField.dart';

class CradBody4 extends StatelessWidget {
  const CradBody4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
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
          Imputfield(
            avalible: flipProvaider.avalible,
            hintext: "Emergency phone",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.phone_android_outlined, color: Colors.blue)
                : const Icon(Icons.phone_android_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
              avalible: flipProvaider.avalible,
              hintext: "Cuban First Name",
              prefixIcon: flipProvaider.avalible
                  ? const Icon(Icons.badge_outlined, color: Colors.blue)
                  : const Icon(Icons.badge_outlined, color: Colors.grey)),
          const Separador(),
          Imputfield(
            avalible: flipProvaider.avalible,
            hintext: "Cuban Last Name",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.badge_outlined, color: Colors.blue)
                : const Icon(Icons.badge_outlined, color: Colors.grey),
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
          Imputfield(
            avalible: flipProvaider.avalible,
            suffixIcon: flipProvaider.avalible
                ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
                : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
            hintext: "Arrival Doc",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.flight_land, color: Colors.blue)
                : const Icon(Icons.flight_land, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            avalible: flipProvaider.avalible,
            suffixIcon: flipProvaider.avalible
                ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
                : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
            hintext: "Country Issuse",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.flag_outlined, color: Colors.blue)
                : const Icon(Icons.flag_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            avalible: flipProvaider.avalible,
            hintext: "Arrival Doc No",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.flight_land, color: Colors.blue)
                : const Icon(Icons.flight_land, color: Colors.grey),
          ),
          Container(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
