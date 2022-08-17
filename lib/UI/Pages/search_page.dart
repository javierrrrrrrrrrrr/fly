import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/imputField.dart';
import 'dart:math' as math;

import '../Widgets/app_background_selection.dart';
import 'airline_details.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: AppBackgroundSelection(
              body: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ExpansionWidget(
                initiallyExpanded: false,
                titleBuilder:
                    (double animationValue, _, bool isExpaned, toogleFunction) {
                  return InkWell(
                      onTap: () => toogleFunction(animated: true),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.98,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.09),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Text(
                                  'Schedule',
                                  style: TextStyle(
                                      fontSize: 22, color: kprimarycolor),
                                )),
                                Transform.rotate(
                                  angle: math.pi * animationValue / 2,
                                  alignment: Alignment.center,
                                  child:
                                      const Icon(Icons.arrow_right, size: 40),
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
                },
                content: SearchFilters(size: size)),
          )),
        ));
  }
}

class SearchFilters extends StatelessWidget {
  const SearchFilters({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.7,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(Radius.circular(size.height * 0.01)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                const TextSearch(texto: 'Flight Number'),
                SizedBox(
                  width: size.width * 0.1,
                ),
                const TextSearch(texto: 'Charter'),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: SizedBox(
                    width: size.width * 0.3,
                    child: const imputfield(hintext: "Flight Number"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.01, left: size.width * 0.12),
                  child: SizedBox(
                    width: size.width * 0.3,
                    child: const imputfield(
                      hintext: " All",
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: const [
                TextSearch(texto: 'Date from:/To:'),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: SizedBox(
                    width: size.width * 0.32,
                    child: imputfield(
                      hintext: "From",
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: kprimarycolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: SizedBox(
                    width: size.width * 0.31,
                    child: imputfield(
                      hintext: "To",
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: kprimarycolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: const [
                TextSearch(texto: 'Route'),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: SizedBox(
                    width: size.width * 0.3,
                    child: const imputfield(
                      hintext: " From",
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: SizedBox(
                    width: size.width * 0.3,
                    child: const imputfield(
                      hintext: " To",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: const [
                TextSearch(texto: 'Weekdays'),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: const [
                weekedDay(texto: "S"),
                espacio(),
                weekedDay(texto: "M"),
                espacio(),
                weekedDay(texto: "T"),
                espacio(),
                weekedDay(texto: "W"),
                espacio(),
                weekedDay(texto: "T"),
                espacio(),
                weekedDay(texto: "F"),
                espacio(),
                weekedDay(texto: "S"),
              ],
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ColumnStatus1(),
                SizedBox(
                  width: size.width * 0.165,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextSearch(texto: 'Gate'),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      width: size.width * 0.29,
                      child: const imputfield(
                        hintext: " Gate Number",
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.018,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                height: size.height * 0.05,
                minWidth: size.width * 0.01,
                color: const Color.fromRGBO(1, 63, 148, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    const Text("Search",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }
}

class ColumnStatus1 extends StatelessWidget {
  const ColumnStatus1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextSearch(texto: "Status"),
        SizedBox(
          height: size.height * 0.004,
        ),
        Row(
          children: [
            CheckStatus(size: size),
            SizedBox(
              width: size.width * 0.015,
            ),
            const TextSearch(texto: "Open"),
            SizedBox(
              width: size.width * 0.010,
            ),
            const Icon(
              Icons.check_circle,
              size: 18,
              color: Colors.green,
            )
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.004,
                ),
                Row(
                  children: [
                    CheckStatus(size: size),
                    SizedBox(
                      width: size.width * 0.015,
                    ),
                    const TextSearch(texto: "Closed"),
                    SizedBox(
                      width: size.width * 0.010,
                    ),
                    const Icon(
                      Icons.cancel,
                      size: 18,
                      color: Colors.red,
                    )
                  ],
                ),
                Row(
                  children: const [],
                ),
              ],
            ),
            Column(
              children: const [],
            ),
          ],
        ),
      ],
    );
  }
}

class CheckStatus extends StatelessWidget {
  const CheckStatus({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromRGBO(1, 1, 1, 1), width: 0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          )),
      height: size.height * 0.030,
      width: size.width * 0.06,
    );
  }
}

class espacio extends StatelessWidget {
  const espacio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.018,
    );
  }
}

class weekedDay extends StatelessWidget {
  const weekedDay({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromRGBO(1, 1, 1, 1), width: 0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          )),
      height: size.height * 0.045,
      width: size.width * 0.09,
      child: Center(child: Text(texto)),
    );
  }
}

class TextSearch extends StatelessWidget {
  const TextSearch({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 18),
    );
  }
}
