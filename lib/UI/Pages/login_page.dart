import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/fondoNubes.jpg"),
                fit: BoxFit.fill,
              ))),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.03),
            child: Container(
              height: size.height * 0.8,
              width: size.width,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/loginIcono.png"),
                      fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.1,
              width: size.width * 0.1,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
