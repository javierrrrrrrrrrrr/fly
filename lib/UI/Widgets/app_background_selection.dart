import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/custom_appbar_row.dart';

class AppBackgroundSelection extends StatelessWidget {
  const AppBackgroundSelection({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/fondo.jpg',
        ),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.08,
          top: size.height * 0.05,
          right: size.width * 0.08,
        ),
        child: Column(
          children: [
            const AppBarRow(),
            // Primera Row de la Vista esto es para guirnos despues en el disenno
            body,
          ],
        ),
      ),
    );
  }
}
