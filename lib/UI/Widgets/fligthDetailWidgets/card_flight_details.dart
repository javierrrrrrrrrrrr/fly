import 'package:flutter/material.dart';
import 'package:fly_cliente/DataLayer/Models/flight_model.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/line.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import 'flight_details_body.dart';
import 'flight_details_footer.dart';
import 'flight_details_header.dart';

/// Carta pequena */
class CardFlightDetails extends StatelessWidget {
  const CardFlightDetails({
    Key? key,
    required this.departureFlight,
    required this.index,
  }) : super(key: key);
  final Flight departureFlight;
  final int index;

  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);

    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
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
              flight: departureFlight,
              lastRowWidget: Row(
                children: [
                  Text(departureFlight.day.substring(0, 3).toUpperCase()),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                ],
              )),
          const Line(),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.03,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: FlightDetailsBody(flight: departureFlight),
          ),
          SizedBox(
            height: size.height * 0.002,
          ),
          const Line(),
          FlightDetailsFooter(
            flight: departureFlight,
          )
        ],
      ),
    );
  }
}
