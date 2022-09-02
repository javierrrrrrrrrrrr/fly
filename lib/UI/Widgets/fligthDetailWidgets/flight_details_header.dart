import 'package:flutter/material.dart';
import 'package:fly_cliente/DataLayer/Models/flight_model.dart';

class FlightDetailsHeader extends StatelessWidget {
  const FlightDetailsHeader({
    Key? key,
    required this.flightProvaider,
  }) : super(key: key);

  final Flight flightProvaider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SeparadorHorizontal(numero: size.width * 0.06),
          Text(flightProvaider.charter),
          // SeparadorHorizontal(numero: size.width * 0.09),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.08),
            child: SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.2,
              child: Image.asset('assets/logo.png'),
            ),
          ),
          //   SeparadorHorizontal(numero: size.width * 0.14),
          Row(
            children: [
              Text(flightProvaider.day.substring(0, 3).toUpperCase()),
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}
