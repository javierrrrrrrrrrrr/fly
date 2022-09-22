import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

class InfoButtom extends StatelessWidget {
  const InfoButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flipProvaider = Provider.of<FlipProvider>(context);
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: size.width * 0.8,
      color: Colors.blue,
      height: size.height * 0.075,
      onPressed: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        flipProvaider.checkFlip(context);
      },
      child: const Text(
        "Continue",
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
