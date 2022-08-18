import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';

import '../Widgets/ExpansionWidget/custom_dropdown.dart';
import '../Widgets/app_background_selection.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AppBackgroundSelection(
            body: SafeArea(
              child: Column(
                children: const [
                  CustomDropDown(),
                ],
              ),
            ),
            padding: EdgeInsets.all(size.width * 0.06),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                        child: CardFlyResumen(),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardFlyResumen extends StatelessWidget {
  const CardFlyResumen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.24,
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
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SeparadorHorizontal(num: size.width * 0.06),
                  const Text('Havana Air'),
                  SeparadorHorizontal(num: size.width * 0.09),
                  SizedBox(
                    height: size.height * 0.06,
                    width: size.width * 0.2,
                    child: Image.asset('assets/logo.png'),
                  ),
                  SeparadorHorizontal(num: size.width * 0.14),
                  const Text('THU'),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                ],
              ),
              const Line(separacion: 0),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.03,
                    left: size.width * 0.05,
                    right: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text('Havana', style: TextStyle(fontSize: 12)),
                        Text('Hav', style: TextStyle(fontSize: 23)),
                        Text('9:50 AM', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(
                        height: size.height * 0.04,
                        width: size.width * 0.4,
                        child: Image.asset(
                          'assets/plane.png',
                          fit: BoxFit.fill,
                        )),
                    Column(
                      children: const [
                        Text('Miami', style: TextStyle(fontSize: 12)),
                        Text('Mia', style: TextStyle(fontSize: 23)),
                        Text('10:55 AM', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
              const Line(separacion: 0.028),
              Row(
                children: [
                  SeparadorHorizontal(num: size.width * 0.05),
                  const Text('Check in  5:50 AM',
                      style: TextStyle(fontSize: 15)),
                  SeparadorHorizontal(num: size.width * 0.16),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: kprimarycolor,
                      minWidth: 100,
                      height: 30,
                      child: const Center(
                          child: Text("More Details",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white))),
                      onPressed: () {}),
                ],
              )
            ],
          ),
          Positioned(
            left: size.width * 0.34,
            bottom: size.height * 0.085,
            child: const Text('Terminal 2'),
          )
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
    required this.separacion,
  }) : super(key: key);

  final double separacion;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.025,
        right: size.width * 0.025,
        top: size.width * separacion,
      ),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.001,
        color: const Color.fromRGBO(0, 0, 0, 0.2),
      ),
    );
  }
}

class SeparadorHorizontal extends StatelessWidget {
  const SeparadorHorizontal({
    Key? key,
    required this.num,
  }) : super(key: key);

  final double num;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: num,
    );
  }
}
