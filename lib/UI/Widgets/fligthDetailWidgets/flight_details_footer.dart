import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/separador_horizontal.dart';

import '../../../Constants/contants.dart';
import '../../../DataLayer/Models/flight_model.dart';

class FlightDetailsFooter extends StatelessWidget {
  const FlightDetailsFooter({
    Key? key,
    required this.flight,
    required this.index,
  }) : super(key: key);

  final Flight flight;
  final int index;

  @override
  Widget build(BuildContext context) {
    int primervalorfrom = int.parse(flight.departure.split(":")[0]);
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SeparadorHorizontal(numero: size.width * 0.05),
        Row(
          children: [
            primervalorfrom >= 10
                ? Text(
                    "Check in ${flight.departure.trim().substring(0, 5)}",
                    style: const TextStyle(fontSize: 15),
                  )
                : Text("Check in ${flight.departure.trim().substring(0, 4)}",
                    style: const TextStyle(fontSize: 15)),
            Text(
                " ${flight.departure.trim().substring(flight.departure.length - 2, flight.departure.length)}",
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
