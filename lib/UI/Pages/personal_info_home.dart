import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body1.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body2.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body4.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body5.dart';
import 'package:provider/provider.dart';

import '../Widgets/CustomWidget/custom_circle_avatar.dart';
import '../Widgets/PerosnalInfoWidgets/crad_body3.dart';

class PersonalInfoHome extends StatelessWidget {
  const PersonalInfoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    return Scaffold(
      //TODO:cambiar la condicion por si tiene o no agregada su info personal
      body: flipProvaider.flip >= 6
          ? Center(
              child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.1,
                    horizontal: size.width * 0.05,
                  ),
                  child: const AppBarCustom(),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/PersonalInfo');
                  },
                  child: Icon(
                    Icons.group_add_outlined,
                    size: 100,
                    color: kprimarycolor,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.8,
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.12),
                      child: const Text(
                        "Add my personal information",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          : PageView(
              scrollDirection: Axis.vertical,
              children: const [
                BodyCustom(
                    body: CardBody1(
                  space: 40,
                )),
                BodyCustom(
                    body: CardBody2(
                  space: 40,
                )),
                BodyCustom(
                    body: CardBody3(
                  space: 40,
                )),
                BodyCustom(
                    body: CardBody4(
                  space: 40,
                )),
                BodyCustom(
                    body: CardBody5(
                  space: 40,
                )),
              ],
            ),
    );
  }
}

class BodyCustom extends StatelessWidget {
  const BodyCustom({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.fill,
          )),
        ),
        Positioned(
          top: size.height * 0.1,
          left: size.width * 0.05,
          child: Container(
              color: Colors.white,
              //  height: size.height * 0.87,
              width: size.width * 0.9,
              child: body),
        ),
      ],
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.navigate_before,
            size: 40,
            color: kprimarycolor,
          ),
        ),
        const CustomCircleAvatar()
      ],
    );
  }
}
