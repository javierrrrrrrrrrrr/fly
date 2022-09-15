import 'package:flutter/material.dart';

class MiniContainerGreen extends StatelessWidget {
  const MiniContainerGreen({
    Key? key,
    required this.valor,
    this.icono,
  }) : super(key: key);

  final String valor;
  final bool? icono;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.03,
        width: size.width * 0.15,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
            child: icono == true
                ? Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Text(
                        valor,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                    valor,
                    style: const TextStyle(color: Colors.white),
                  ))));
  }
}
