import 'package:flutter/material.dart';

import '../../../DataLayer/Models/flight_model.dart';

class FlightDetailsBody extends StatelessWidget {
  const FlightDetailsBody({
    Key? key,
    required this.flightProvaider,
  }) : super(key: key);

  final Flight flightProvaider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    /* from*/
    final String base = flightProvaider.from;
    final String nombreCiudadEntero =
        flightProvaider.from.substring(5, base.length);
    final String nombreCiudadReducido = flightProvaider.from.substring(0, 3);
/* to*/
    final String base1 = flightProvaider.to;
    final String nombreCiudadEntero1 =
        flightProvaider.to.substring(5, base1.length);
    final String nombreCiudadReducido1 = flightProvaider.to.substring(0, 3);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
              width: size.width * 0.19,
              // color: Colors.red,
              child: Center(
                child: Text(
                  nombreCiudadEntero,
                  style: const TextStyle(fontSize: 12),
                  maxLines: 1,
                ),
              ),
            ),
            Text(nombreCiudadReducido, style: const TextStyle(fontSize: 23)),
            Row(
              children: [
                Text(flightProvaider.departure.trim().substring(0, 4),
                    style: const TextStyle(fontSize: 16)),
                Text(
                    " ${flightProvaider.departure.trim().substring(flightProvaider.departure.length - 2, flightProvaider.departure.length)}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
                height: size.height * 0.04,
                width: size.width * 0.4,
                child: Image.asset(
                  'assets/plane.png',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: size.height * 0.015,
            ),
            Text(flightProvaider.gate)
          ],
        ),
        Column(
          children: [
            SizedBox(
                height: size.height * 0.02,
                width: size.width * 0.19,
                child: Center(
                    child: Text(nombreCiudadEntero1,
                        style: const TextStyle(fontSize: 12)))),
            Text(nombreCiudadReducido1, style: const TextStyle(fontSize: 23)),
            Row(
              children: [
                Text(flightProvaider.arrival.trim().substring(0, 4),
                    style: const TextStyle(fontSize: 16)),
                Text(
                    " ${flightProvaider.arrival.trim().substring(flightProvaider.arrival.length - 2, flightProvaider.arrival.length)}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
