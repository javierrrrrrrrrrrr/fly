import 'package:flutter/material.dart';

import '../../../Constants/contants.dart';

class CustomRowDrawer extends StatelessWidget {
  const CustomRowDrawer({
    Key? key,
    required this.icono,
    required this.texto,
    required this.tamnofuente,
    this.onPressed,
  }) : super(key: key);

  final IconData icono;
  final String texto;
  final double tamnofuente;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            icono,
            color: kprimarycolor,
            size: size.height * 0.038,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(texto, style: TextStyle(fontSize: tamnofuente)),
        ],
      ),
    );
  }
}
