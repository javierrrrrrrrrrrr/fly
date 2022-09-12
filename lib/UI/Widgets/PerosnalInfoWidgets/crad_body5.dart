import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flipProvider.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imputField.dart';
import 'package:provider/provider.dart';

class CradBody5 extends StatelessWidget {
  const CradBody5({Key? key}) : super(key: key);

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
              "Primary Documents",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          Imputfield(
            avalible: flipProvaider.avalible,
            suffixIcon: flipProvaider.avalible
                ? const Icon(Icons.calendar_month, color: Colors.blue)
                : const Icon(Icons.calendar_month, color: Colors.grey),
            hintext: "Exp Date",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.article_outlined, color: Colors.blue)
                : const Icon(Icons.article_outlined, color: Colors.grey),
          ),
          const Separador(),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Secondary Documents",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          Imputfield(
            avalible: flipProvaider.avalible,
            suffixIcon: flipProvaider.avalible
                ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
                : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
            hintext: "Passport",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.import_contacts_outlined, color: Colors.blue)
                : const Icon(Icons.import_contacts_outlined,
                    color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            avalible: flipProvaider.avalible,
            suffixIcon: flipProvaider.avalible
                ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
                : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
            hintext: "Country of Issue",
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
          const Separador(),
          Imputfield(
            avalible: flipProvaider.avalible,
            suffixIcon: flipProvaider.avalible
                ? const Icon(Icons.calendar_month, color: Colors.blue)
                : const Icon(Icons.calendar_month, color: Colors.grey),
            hintext: "Exp Date",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.article_outlined, color: Colors.blue)
                : const Icon(Icons.article_outlined, color: Colors.grey),
          ),
          const Separador(),
          Container(
            height: size.height * 0.06,
          ),
        ],
      ),
    );
  }
}
