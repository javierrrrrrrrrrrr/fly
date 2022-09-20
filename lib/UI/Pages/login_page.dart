import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/fondoNubes.jpg"),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.031),
          child: Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    image: AssetImage("assets/loginIcono.png"),
                    fit: BoxFit.fill)),
          ),
        ),
      ),
    );
  }
}
