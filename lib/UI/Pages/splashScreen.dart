import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/fondo.jpg"), context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      height: size.height,
      width: size.width,
      child: Center(
          child: Lottie.asset(
        "assets/65162-isometric-plane.json",
      )),
    );
  }
}
