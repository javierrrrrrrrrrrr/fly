import 'package:flutter/material.dart';

class FlightDetailsHeader extends StatelessWidget {
  const FlightDetailsHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SeparadorHorizontal(numero: size.width * 0.06),
          const Text('Havana Air'),
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
            children: const [
              Text('THU'),
              Icon(
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
