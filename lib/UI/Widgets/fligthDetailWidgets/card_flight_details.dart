import 'package:flutter/material.dart';
import 'package:fly_cliente/DataLayer/Models/flight_model.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/line.dart';

import '../../../Constants/contants.dart';
import 'flight_details_body.dart';
import 'flight_details_footer.dart';
import 'flight_details_header.dart';
import 'horizontal_discontinuos_line.dart';

/// Carta pequena */
class CardFlightDetails extends StatelessWidget {
  const CardFlightDetails({
    Key? key,
    required this.flight,
    this.isCheckedPage,
    this.customtext,
  }) : super(key: key);
  final Flight flight;
  final bool? isCheckedPage;
  final String? customtext;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: isCheckedPage == true ? size.height * 0.23 : size.height * 0.25,
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
      child: Column(
        children: [
          FlightDetailsHeader(
              customtext: isCheckedPage == true ? customtext : '',
              isCheckedPage: isCheckedPage,
              flight: flight,
              lastRowWidget: Row(
                children: [
                  Text(flight.day.substring(0, 3).toUpperCase()),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                ],
              )),
          isCheckedPage == true
              ? const HorizontalDiscontinuosLine()
              : const LineSeparator(),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.03,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: isCheckedPage == true
                ? _CheckPayCardBody(flight: flight)
                : FlightDetailsBody(flight: flight),
          ),
          SizedBox(
            height: size.height * 0.002,
          ),
          isCheckedPage == true ? Container() : const LineSeparator(),
          isCheckedPage == true
              ? Container()
              : FlightDetailsFooter(
                  flight: flight,
                ),
        ],
      ),
    );
  }
}

class _CheckPayCardBody extends StatelessWidget {
  const _CheckPayCardBody({
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

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            primervalorfrom >= 10
                ? Row(
                    children: [
                      const Text(
                        "Check in",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        flight.checkIn.trim().substring(0, 5),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                          " ${flight.checkIn.trim().substring(flight.checkIn.length - 2, flight.checkIn.length)}",
                          style: const TextStyle(fontSize: 15)),
                    ],
                  )
                : Row(
                    children: [
                      const Text("Check in ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(flight.checkIn.trim().substring(0, 4),
                          style: const TextStyle(fontSize: 15)),
                      Text(
                          " ${flight.checkIn.trim().substring(flight.checkIn.length - 2, flight.checkIn.length)}",
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
            Row(
              children: [
                Icon(
                  Icons.airline_seat_recline_normal_outlined,
                  color: kprimarycolor,
                ),
                const Text('Economy'),
              ],
            ),
          ],
        ),
        Row(
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
                Text(nombreCiudadReducido,
                    style: const TextStyle(fontSize: 23)),
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
                Text(nombreCiudadReducido1,
                    style: const TextStyle(fontSize: 23)),
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
        ),
      ],
    );
  }
}
