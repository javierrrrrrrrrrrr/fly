import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import '../../../DataLayer/Models/flight_model.dart';

class FlightDetailsHeader extends StatelessWidget {
  const FlightDetailsHeader({
    Key? key,
    required this.flight,
    required this.lastRowWidget,
    this.isCheckedPage,
    this.customtext,
  }) : super(key: key);

  final Flight flight;
  final Widget lastRowWidget;
  final bool? isCheckedPage;
  final String? customtext;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flightProvaider = Provider.of<FlightProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isCheckedPage == true
              ? Text(customtext!)
              : Text(
                  "${flight.date.substring(flight.date.length - 2, flight.date.length)} ${flightProvaider.convertDayMonthToLeterDay(flight.date)}"),

          // SeparadorHorizontal(numero: size.width * 0.09),
          SizedBox(
            height: size.height * 0.06,
            width: size.width * 0.2,
            child: Image.asset('assets/logo.png'),
          ),

          isCheckedPage == true
              ? Text(
                  "${flight.date.substring(flight.date.length - 2, flight.date.length)} ${flightProvaider.convertDayMonthToLeterDay(flight.date)}")
              : SizedBox(
                  width: size.width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      lastRowWidget,
                    ],
                  ))
        ],
      ),
    );
  }
}
