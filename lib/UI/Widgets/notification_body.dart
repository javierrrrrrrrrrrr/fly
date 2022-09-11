import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key? key, required this.texto}) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.1, vertical: size.height * 0.17),
      height: size.height * 0.1,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(23, 199, 119, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline_outlined,
            color: Colors.white,
            size: 40,
          ),
          Text(
            texto,
            style: const TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      ),
    );
  }
}
