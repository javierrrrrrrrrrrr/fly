import 'package:flutter/material.dart';

class AppBackgroundSelection extends StatelessWidget {
  const AppBackgroundSelection({
    Key? key,
    required this.body,
    this.customAppBar,
    required this.padding,
  }) : super(key: key);

  final Widget body;
  final Widget? customAppBar;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/fondo.jpg',
            ),
            fit: BoxFit.fill,
          )),
        ),
        Padding(
          padding: padding,
          child: Column(
            children: [
              customAppBar ?? Container(),
              // Primera Row de la Vista esto es para guirnos despues en el disenno
              body,
            ],
          ),
        ),
      ],
    );
  }
}
