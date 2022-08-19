import 'package:flutter/material.dart';

class SeparadorHorizontal extends StatelessWidget {
  const SeparadorHorizontal({
    Key? key,
    required this.numero,
  }) : super(key: key);

  final double numero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: numero,
    );
  }
}
