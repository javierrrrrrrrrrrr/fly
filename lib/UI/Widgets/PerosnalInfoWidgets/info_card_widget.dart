import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body2.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body3.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body4.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body5.dart';
import 'package:provider/provider.dart';
import 'crad_body1.dart';

class InfoCardWIdget extends StatelessWidget {
  const InfoCardWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flipProvaider = Provider.of<FlipProvider>(context);
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.02),
        // height: size.height * 0.63,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: flipProvaider.flip == 0
            ? const CradBody1()
            : flipProvaider.flip == 1
                ? const CradBody2()
                : flipProvaider.flip == 2
                    ? const CradBody3()
                    : flipProvaider.flip == 3
                        ? const CradBody4()
                        : const CradBody5());
  }
}
