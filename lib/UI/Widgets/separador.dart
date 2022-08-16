import 'package:flutter/material.dart';

class Separador extends StatelessWidget {
  const Separador({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.018,
    );
  }
}
