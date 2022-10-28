import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/login_provider.dart';
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
    // Future.delayed(const Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const HomePage()));
    // });
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/fondo.jpg"), context);

    super.didChangeDependencies();
    logUser();
  }

  void logUser() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    bool respuesta = await loginProvider.uUIDMaker();
    if (respuesta == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
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
