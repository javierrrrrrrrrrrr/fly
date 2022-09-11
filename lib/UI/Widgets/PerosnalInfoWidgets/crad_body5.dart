import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imputField.dart';

class CradBody5 extends StatelessWidget {
  const CradBody5({Key? key}) : super(key: key);

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
              "Primary Documents",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          const Imputfield(
            suffixIcon: Icon(Icons.calendar_month, color: Colors.blue),
            hintext: "Exp Date",
            prefixIcon: Icon(Icons.note, color: Colors.blue),
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
          const Imputfield(
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
            hintext: "Passport",
            prefixIcon: Icon(Icons.menu_book_rounded, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
            hintext: "Country of Issue",
            prefixIcon: Icon(Icons.emoji_flags_sharp, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            hintext: "Arrival Doc No",
            prefixIcon:
                Icon(Icons.airplanemode_active_outlined, color: Colors.blue),
          ),
          const Separador(),
          const Imputfield(
            suffixIcon: Icon(Icons.calendar_month, color: Colors.blue),
            hintext: "Exp Date",
            prefixIcon: Icon(Icons.note, color: Colors.blue),
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
