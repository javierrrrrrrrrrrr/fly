import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flip_provider.dart';
import '../CustomWidget/custom_circle_avatar.dart';

class InfoCheckRowProgress extends StatefulWidget {
  const InfoCheckRowProgress({
    Key? key,
  }) : super(key: key);

  @override
  State<InfoCheckRowProgress> createState() => _InfoCheckRowProgressState();
}

@override
void initState() {}

class _InfoCheckRowProgressState extends State<InfoCheckRowProgress> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    return SizedBox(
      height: size.height * 0.22,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.width * 0.04,
                  bottom: size.width * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back_ios)),
                    const CustomCircleAvatar(),
                  ],
                ),
              ),
              Row(
                children: [
                  CirclewithNumberAndCheck(
                      number: '1', control: flipProvaider.controllerCircle1),
                  Line(control: flipProvaider.controllerLine1),
                  CirclewithNumberAndCheck(
                    number: '2',
                    control: flipProvaider.controllerCircle2,
                  ),
                  Line(
                    control: flipProvaider.controllerLine2,
                  ),
                  CirclewithNumberAndCheck(
                    number: '3',
                    control: flipProvaider.controllerCircle3,
                  ),
                  Line(
                    control: flipProvaider.controllerLine3,
                  ),
                  CirclewithNumberAndCheck(
                    number: '4',
                    control: flipProvaider.controllerCircle4,
                  ),
                  Line(
                    control: flipProvaider.controllerLine4,
                  ),
                  CirclewithNumberAndCheck(
                      number: '5', control: flipProvaider.controllerCircle5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
    required this.control,
  }) : super(key: key);

  final FlipCardController control;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FlipCard(
      speed: 1000,
      controller: control,
      front: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        height: size.height * 0.008,
        width: size.width * 0.06,
        decoration: const BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5.0),
              blurRadius: 5,
              color: Color.fromRGBO(155, 155, 155, 0.5),
            ),
          ],
        ),
      ),
      back: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        height: size.height * 0.008,
        width: size.width * 0.06,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5.0),
              blurRadius: 5,
              color: Color.fromRGBO(155, 155, 155, 0.5),
            ),
          ],
          color: Color.fromRGBO(23, 199, 119, 1),
        ),
      ),
    );
  }
}

class CirclewithNumberAndCheck extends StatelessWidget {
  const CirclewithNumberAndCheck({
    Key? key,
    required this.number,
    required this.control,
  }) : super(key: key);

  final FlipCardController control;
  final String number;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FlipCard(
      speed: 1000,
      controller: control,
      front: Container(
        height: size.height * 0.050,
        width: size.width * 0.105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5.0),
              blurRadius: 5,
              color: Color.fromRGBO(155, 155, 155, 0.5),
            ),
          ],
        ),
        child: Center(
            child: Text(
          number,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        )),
      ),
      back: Container(
        height: size.height * 0.06,
        width: size.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5.0),
              blurRadius: 5,
              color: Color.fromRGBO(155, 155, 155, 0.5),
            ),
          ],
          color: const Color.fromRGBO(23, 199, 119, 1),
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
