import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey,
          )
        ],
      ),
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25,
        backgroundImage: AssetImage('assets/fondo.png'),
      ),
    );
  }
}
