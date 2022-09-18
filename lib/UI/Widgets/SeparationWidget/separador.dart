import 'package:flutter/material.dart';

class Separador extends StatelessWidget {
  const Separador({
    Key? key,
    this.space,
    this.texto,
  }) : super(key: key);

  final double? space;
  final String? texto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      //color: Colors.grey.withOpacity(0.1),
      height: space ?? size.height * 0.018,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.03),
        child: texto == null
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    texto ?? "",
                    style: const TextStyle(fontSize: 18),
                    // textAlign: TextAlign.start,
                  ),
                ],
              ),
      ),
    );
  }
}
