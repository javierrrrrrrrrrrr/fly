import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/line.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import 'flight_details_body.dart';
import 'flight_details_footer.dart';
import 'flight_details_header.dart';

class CardFlightDetails extends StatelessWidget {
  const CardFlightDetails({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.24,
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
          FlightDetailsHeader(flightProvaider: flightProvaider.flights[index]),
          const Line(),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.03,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: FlightDetailsBody(
                flightProvaider: flightProvaider.flights[index]),
          ),
          SizedBox(
            height: size.height * 0.022,
          ),
          const Line(),
          FlightDetailsFooter(
            flightProvaider: flightProvaider.flights[index],
            index: index,
          )
        ],
      ),
    );
  }
}
