import 'package:flutter/material.dart';

class FlightDetailsBody extends StatelessWidget {
  const FlightDetailsBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: const [
            Text('Havana', style: TextStyle(fontSize: 12)),
            Text('Hav', style: TextStyle(fontSize: 23)),
            Text('9:50 AM', style: TextStyle(fontSize: 16)),
          ],
        ),
        Column(
          children: [
            SizedBox(
                height: size.height * 0.04,
                width: size.width * 0.4,
                child: Image.asset(
                  'assets/plane.png',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: size.height * 0.015,
            ),
            const Text('Terminal 2')
          ],
        ),
        Column(
          children: const [
            Text('Miami', style: TextStyle(fontSize: 12)),
            Text('Mia', style: TextStyle(fontSize: 23)),
            Text('10:55 AM', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
