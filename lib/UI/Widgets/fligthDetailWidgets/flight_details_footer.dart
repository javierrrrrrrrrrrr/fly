import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/separador_horizontal.dart';

import '../../../Constants/contants.dart';
import '../../../DataLayer/Models/flight_model.dart';

class FlightDetailsFooter extends StatelessWidget {
  const FlightDetailsFooter({
    Key? key,
    required this.flightProvaider,
    required this.index,
  }) : super(key: key);

  final Flight flightProvaider;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SeparadorHorizontal(numero: size.width * 0.05),
        Row(
          children: [
            Text("Check in ${flightProvaider.departure.trim().substring(0, 4)}",
                style: const TextStyle(fontSize: 15)),
            Text(
                " ${flightProvaider.departure.trim().substring(flightProvaider.departure.length - 2, flightProvaider.departure.length)}",
                style: const TextStyle(fontSize: 15)),
          ],
        ),
        SeparadorHorizontal(numero: size.width * 0.16),
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: kprimarycolor,
            minWidth: 100,
            height: 30,
            child: const Center(
                child: Text("More Details",
                    style: TextStyle(fontSize: 14, color: Colors.white))),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/MoreDetailsFly", arguments: index);
            }),
      ],
    );
  }
}
