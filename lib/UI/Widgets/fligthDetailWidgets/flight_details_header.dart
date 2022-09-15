import 'package:flutter/material.dart';
import 'package:fly_cliente/DataLayer/Models/flight_model.dart';

class FlightDetailsHeader extends StatelessWidget {
  const FlightDetailsHeader({
    Key? key,
    required this.flight,
    required this.lastRowWidget,
  }) : super(key: key);

  final Flight flight;
  final Widget lastRowWidget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SeparadorHorizontal(numero: size.width * 0.06),
          Text(flight.charter),
          // SeparadorHorizontal(numero: size.width * 0.09),
          SizedBox(
            height: size.height * 0.06,
            width: size.width * 0.2,
            child: Image.asset('assets/logo.png'),
          ),
          //   SeparadorHorizontal(numero: size.width * 0.14),
          SizedBox(
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
