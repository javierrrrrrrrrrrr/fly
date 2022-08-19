import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/line.dart';

import '../../../Constants/contants.dart';
import 'flight_details_body.dart';
import 'flight_details_header.dart';
import 'separador_horizontal.dart';

class CardFlightDetails extends StatelessWidget {
  const CardFlightDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          FlightDetailsHeader(size: size),
          const Line(),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.03,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: FlightDetailsBody(size: size),
          ),
          SizedBox(
            height: size.height * 0.022,
          ),
          const Line(),
          FlightDetailsFooter(size: size)
        ],
      ),
    );
  }
}

class FlightDetailsFooter extends StatelessWidget {
  const FlightDetailsFooter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SeparadorHorizontal(numero: size.width * 0.05),
        const Text('Check in  5:50 AM', style: TextStyle(fontSize: 15)),
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
              Navigator.of(context).pushNamed("/MoreDetailsFly");
            }),
      ],
    );
  }
}
