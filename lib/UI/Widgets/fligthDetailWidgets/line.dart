import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.025,
        right: size.width * 0.025,
      ),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.001,
        color: const Color.fromRGBO(0, 0, 0, 0.2),
      ),
    );
  }
}
