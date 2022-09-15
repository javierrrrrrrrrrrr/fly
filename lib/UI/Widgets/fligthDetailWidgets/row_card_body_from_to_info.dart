import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/vertical_discontinuos_line.dart';

import '../../../Constants/contants.dart';
import '../../../DataLayer/Models/flight_model.dart';

class RowCardBodyFromToInfo extends StatelessWidget {
  const RowCardBodyFromToInfo({
    Key? key,
    required this.selected,
  }) : super(key: key);

  final Flight selected;

  @override
  Widget build(BuildContext context) {
    /* from*/
    int primervalorfrom = int.parse(selected.departure.split(":")[0]);
    final String base = selected.from;
    final String nombreCiudadEntero = selected.from.substring(5, base.length);
    final String nombreCiudadReducido = selected.from.substring(0, 3);
    /* to*/
    final String base1 = selected.to;
    final String nombreCiudadEntero1 = selected.to.substring(5, base1.length);
    final String nombreCiudadReducido1 = selected.to.substring(0, 3);
    int primervalorto = int.parse(selected.arrival.split(":")[0]);

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: size.width * 0.03,
          left: size.width * 0.05,
          right: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(nombreCiudadEntero, style: const TextStyle(fontSize: 12)),
              Text(nombreCiudadReducido, style: const TextStyle(fontSize: 23)),
              Row(
                children: [
                  primervalorfrom >= 10
                      ? Text(selected.departure.trim().substring(0, 5),
                          style: const TextStyle(fontSize: 16))
                      : Text(selected.departure.trim().substring(0, 4),
                          style: const TextStyle(fontSize: 16)),
                  Text(
                      " ${selected.departure.trim().substring(selected.departure.length - 2, selected.departure.length)}",
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
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
                  Text(selected.gate),
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
                  primervalorto >= 10
                      ? Text(selected.arrival.trim().substring(0, 5),
                          style: const TextStyle(fontSize: 16))
                      : Text(selected.arrival.trim().substring(0, 4),
                          style: const TextStyle(fontSize: 16)),
                  Text(
                      " ${selected.arrival.trim().substring(selected.arrival.length - 2, selected.arrival.length)}",
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
