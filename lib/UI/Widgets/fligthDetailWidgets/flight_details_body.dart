import 'package:flutter/material.dart';

import '../../../Constants/contants.dart';
import '../../../DataLayer/Models/flight_model.dart';

class FlightDetailsBody extends StatelessWidget {
  const FlightDetailsBody({
    Key? key,
    required this.flight,
  }) : super(key: key);

  final Flight flight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
//variables para controlar el largo de la fecha
    /* from*/
    int primervalorfrom = int.parse(flight.departure.split(":")[0]);
    final String base = flight.from;
    final String nombreCiudadEntero = flight.from.substring(5, base.length);
    final String nombreCiudadReducido = flight.from.substring(0, 3);
/* to*/
    int primervalorto = int.parse(flight.arrival.split(":")[0]);
    final String base1 = flight.to;
    final String nombreCiudadEntero1 = flight.to.substring(5, base1.length);
    final String nombreCiudadReducido1 = flight.to.substring(0, 3);

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
                primervalorfrom >= 10
                    ? Text(
                        flight.departure.trim().substring(0, 5),
                        style: const TextStyle(fontSize: 16),
                      )
                    : Text(
                        flight.departure.trim().substring(0, 4),
                        style: const TextStyle(fontSize: 16),
                      ),
                Text(
                    " ${flight.departure.trim().substring(flight.departure.length - 2, flight.departure.length)}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
                // color: Colors.red,
                // height: size.height * 0.04,
                width: size.width * 0.4,
                child: Image.asset(
                  'assets/plane.png',
                  fit: BoxFit.fill,
                )),
            Column(
              children: [
                Text(flight.gate),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline_outlined,
                      color: kprimarycolor,
                    ),
                    const Text('Económica'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
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
                primervalorto >= 10
                    ? Text(
                        flight.arrival.trim().substring(0, 5),
                        style: const TextStyle(fontSize: 16),
                      )
                    : Text(
                        flight.arrival.trim().substring(0, 4),
                        style: const TextStyle(fontSize: 16),
                      ),
                Text(
                    " ${flight.arrival.trim().substring(flight.arrival.length - 2, flight.arrival.length)}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
