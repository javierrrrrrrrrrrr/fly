import 'package:flutter/material.dart';

class InfoCardWIdget extends StatelessWidget {
  const InfoCardWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      height: size.height * 0.63,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
