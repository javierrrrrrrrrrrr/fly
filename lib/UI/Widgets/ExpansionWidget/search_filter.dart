import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Business_logic/Provaiders/flight_provider.dart';
import '../../../Constants/contants.dart';
import '../imputField.dart';

class SearchFilters extends StatelessWidget {
  const SearchFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.72,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.1,
        ),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(Radius.circular(size.height * 0.01)),
      ),
      padding: EdgeInsets.only(
          left: size.width * 0.070,
          right: size.width * 0.050,
          top: size.width * 0.08),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const TextSearch(texto: 'Flight Number'),
            SizedBox(
              width: size.width * 0.12,
            ),
            const TextSearch(texto: 'Charter'),
          ],
        ),
        //Segunda Row
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.318,
                child: const Imputfield(hintext: "Flight Number"),
              ),
              SizedBox(
                width: size.width * 0.12,
              ),
              SizedBox(
                width: size.width * 0.318,
                //TODO: Hacer el DropDownMeny de aqui.
                child: const Imputfield(
                  hintext: " All",
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ],
          ),
        ),
        //separador
        SizedBox(
          height: size.height * 0.02,
        ),
        const TextSearch(texto: 'Date from:/To:'),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: SizedBox(
                width: size.width * 0.318,
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
            //separador
            SizedBox(
              width: size.width * 0.12,
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: SizedBox(
                width: size.width * 0.318,
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
        //separador height
        SizedBox(
          height: size.height * 0.02,
        ),
        const TextSearch(texto: 'Route'),
        //ROw
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.318,
                child: const Imputfield(
                  hintext: " From",
                ),
              ),
              //separador width
              SizedBox(
                width: size.width * 0.11,
              ),
              SizedBox(
                width: size.width * 0.318,
                child: const Imputfield(
                  hintext: " To",
                ),
              ),
            ],
          ),
        ),
        //separador height
        SizedBox(
          height: size.height * 0.02,
        ),
        const TextSearch(texto: 'Weekdays'),
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
              width: size.width * 0.15,
            ),
            const ColumnaStatus2()
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });

              await flightProvaider.getFlight();
              var respuesta = flightProvaider.respuesta;

              if (respuesta == true) {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/result');
              } else {
                /*Mostrar al Usaqrio el error */
                Navigator.pop(context);
              }
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
          width: size.width * 0.318,
          child: const Imputfield(
            hintext: " Gate Number",
          ),
        ),
      ],
    );
  }
}
