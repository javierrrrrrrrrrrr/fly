import 'package:flutter/material.dart';

import '../../Constants/contants.dart';

class CustomRowDrawer extends StatelessWidget {
  const CustomRowDrawer({
    Key? key,
    required this.icono,
    required this.texto,
    required this.tamnofuente,
  }) : super(key: key);

  final IconData icono;
  final String texto;
  final double tamnofuente;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icono,
          color: kprimarycolor,
          size: 28,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text(texto, style: TextStyle(fontSize: tamnofuente)),
      ],
    );
  }
}
