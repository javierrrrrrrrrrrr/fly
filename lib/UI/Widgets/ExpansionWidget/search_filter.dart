import 'package:flutter/material.dart';

import '../../../Constants/contants.dart';
import '../imputField.dart';

class SearchFilters extends StatelessWidget {
  const SearchFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.7,
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
                    child: const Imputfield(hintext: "Flight Number"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.01, left: size.width * 0.12),
                  child: SizedBox(
                    width: size.width * 0.3,
                    //TODO: Hacer el DropDownMeny de aqui.
                    child: const Imputfield(
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
                    child: Imputfield(
                      hintext: "From",
                      //Aqui va el action del calendar
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
                    child: Imputfield(
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
                    child: const Imputfield(
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
                    child: const Imputfield(
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
                WeekedDay(texto: "S"),
                CustomSpacer(),
                WeekedDay(texto: "M"),
                CustomSpacer(),
                WeekedDay(texto: "T"),
                CustomSpacer(),
                WeekedDay(texto: "W"),
                CustomSpacer(),
                WeekedDay(texto: "T"),
                CustomSpacer(),
                WeekedDay(texto: "F"),
                CustomSpacer(),
                WeekedDay(texto: "S"),
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
                const ColumnaStatus2()
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/result');
                },
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
              ],
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

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({
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

class WeekedDay extends StatelessWidget {
  const WeekedDay({
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

class ColumnaStatus2 extends StatelessWidget {
  const ColumnaStatus2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextSearch(texto: 'Gate'),
        SizedBox(
          height: size.height * 0.01,
        ),
        SizedBox(
          width: size.width * 0.29,
          child: const Imputfield(
            hintext: " Gate Number",
          ),
        ),
      ],
    );
  }
}
