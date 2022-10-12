import 'package:flutter/material.dart';
import 'separador_horizontal.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import '../../../Constants/contants.dart';
import '../../../DataLayer/Models/flight_model.dart';

class FlightDetailsFooter extends StatelessWidget {
  const FlightDetailsFooter({
    Key? key,
    required this.flight,
    this.isstatuscard,
  }) : super(key: key);

  final Flight flight;
  final bool? isstatuscard;

  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);

    int primervalorfrom = int.parse(flight.checkIn.split(":")[0]);
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SeparadorHorizontal(numero: size.width * 0.05),
        Row(
          children: [
            primervalorfrom >= 10
                ? Text(
                    "Check in ${flight.checkIn.trim().substring(0, 5)}",
                    style: const TextStyle(fontSize: 15),
                  )
                : Text("Check in ${flight.checkIn.trim().substring(0, 4)}",
                    style: const TextStyle(fontSize: 15)),
            Text(
                " ${flight.checkIn.trim().substring(flight.checkIn.length - 2, flight.checkIn.length)}",
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
                child: Text("Más detalles",
                    style: TextStyle(fontSize: 14, color: Colors.white))),
            onPressed: () {
              if (isstatuscard == true) {
                Navigator.of(context).pushNamed('/check_pay');
              } else {
                flightProvaider.selectedDepartureFlight = flight;
                ////////////////////////////////////////////////////////
                Navigator.of(context).pushNamed(
                  "/MoreDetailsFly",
                );
              }
              //Esto es para actualizar el flight selecionado...
            }),
      ],
    );
  }
}
