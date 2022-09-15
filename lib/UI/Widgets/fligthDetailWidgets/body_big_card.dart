import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/vertical_discontinuos_line.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import '../../../Constants/contants.dart';

class BodyBigCard extends StatelessWidget {
  const BodyBigCard({
    Key? key,
    required this.index,
    required this.flightProvaider,
  }) : super(key: key);

  final FlightProvider flightProvaider;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /* from*/
    final String base = flightProvaider.departureflights[index].from;
    final String nombreCiudadEntero =
        flightProvaider.departureflights[index].from.substring(5, base.length);
    final String nombreCiudadReducido =
        flightProvaider.departureflights[index].from.substring(0, 3);
    /* to*/
    final String base1 = flightProvaider.departureflights[index].to;
    final String nombreCiudadEntero1 =
        flightProvaider.departureflights[index].to.substring(5, base1.length);
    final String nombreCiudadReducido1 =
        flightProvaider.departureflights[index].to.substring(0, 3);

    return Column(
      children: [
        Text(nombreCiudadEntero, style: const TextStyle(fontSize: 12)),
        Text(nombreCiudadReducido, style: const TextStyle(fontSize: 23)),
        Row(
          children: [
            Text(
                flightProvaider.departureflights[index].departure
                    .trim()
                    .substring(0, 4),
                style: const TextStyle(fontSize: 16)),
            Text(
                " ${flightProvaider.departureflights[index].departure.trim().substring(flightProvaider.departureflights[index].departure.length - 2, flightProvaider.departureflights[index].departure.length)}",
                style: const TextStyle(fontSize: 16)),
          ],
        ),
        const VerticalDiscontinuosLine(),
        Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.airline_seat_legroom_extra_rounded,
                      color: kprimarycolor,
                    ),
                    const Text("Economy"),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(flightProvaider.departureflights[index].gate),
              ],
            )
          ],
        ),
        const VerticalDiscontinuosLine(),
        Column(
          children: [
            Text(nombreCiudadEntero1, style: const TextStyle(fontSize: 12)),
            Text(nombreCiudadReducido1, style: const TextStyle(fontSize: 23)),
            Row(
              children: [
                Text(
                    flightProvaider.departureflights[index].arrival
                        .trim()
                        .substring(0, 4),
                    style: const TextStyle(fontSize: 16)),
                Text(
                    " ${flightProvaider.departureflights[index].arrival.trim().substring(flightProvaider.departureflights[index].arrival.length - 2, flightProvaider.departureflights[index].arrival.length)}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PriceColumn extends StatelessWidget {
  const PriceColumn({
    Key? key,
    required this.price,
    required this.person,
    required this.icon,
  }) : super(key: key);

  final String price;
  final String person;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            Text(
              person,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        Text(
          "\$$price",
          style: const TextStyle(fontSize: 28, color: Colors.green),
        ),
      ],
    );
  }
}
