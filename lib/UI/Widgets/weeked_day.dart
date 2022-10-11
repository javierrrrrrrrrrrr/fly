import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/flight_provider.dart';
import '../../Constants/contants.dart';

class WeekedDay extends StatefulWidget {
  const WeekedDay({
    Key? key,
    required this.texto,
    required this.isSelected,
  }) : super(key: key);

  final String texto;
  final bool isSelected;
  @override
  State<WeekedDay> createState() => _WeekedDayState();
}

class _WeekedDayState extends State<WeekedDay> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.isSelected;
    final flightProvaider = Provider.of<FlightProvider>(context);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        flightProvaider.selectedWeekDay =
            flightProvaider.convertDayWeekToLongDay(widget.texto);
        flightProvaider.cleanIsselectedDays();

        flightProvaider.changevalue(true);

        setState(() {
          for (var i = 0; i < flightProvaider.dayInWeekList.length; i++) {
            if (flightProvaider.dayInWeekList[i].dayName == widget.texto) {
              flightProvaider.dayInWeekList[i].isSelected = true;
            }
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: selected == true ? kprimarycolor : Colors.transparent,
            border:
                Border.all(color: const Color.fromRGBO(1, 1, 1, 1), width: 0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            )),
        height: size.height * 0.045,
        width: size.width * 0.09,
        child: Center(
            child: Text(
          widget.texto,
          style:
              TextStyle(color: selected == true ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
