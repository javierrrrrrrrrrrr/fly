import 'package:flutter/material.dart';

import '../../../DataLayer/Models/flight_model.dart';

class RowCheckInInfo extends StatelessWidget {
  const RowCheckInInfo({
    Key? key,
    this.miniContainerGreen1,
    this.miniContainerGreen2,
    required this.padding,
    required this.selected,
  }) : super(key: key);
  final Widget? miniContainerGreen1;
  final Widget? miniContainerGreen2;
  final Flight selected;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    int primervalorfrom = int.parse(selected.checkIn.split(":")[0]);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: padding,
      child: Row(
        children: [
          primervalorfrom >= 10
              ? Text(
                  "Check in ${selected.checkIn.trim().substring(0, 5)}",
                  style: const TextStyle(fontSize: 20),
                )
              : Text("Check in ${selected.checkIn.trim().substring(0, 4)}",
                  style: const TextStyle(fontSize: 20)),
          Text(
              " ${selected.departure.trim().substring(selected.departure.length - 2, selected.departure.length)}",
              style: const TextStyle(fontSize: 20)),
          SizedBox(
            width: size.width * 0.05,
          ),
          miniContainerGreen1 ??
              Container(
                width: size.width * 0.128,
              ),
          SizedBox(
            width: size.width * 0.03,
          ),
          miniContainerGreen2 ?? Container()
        ],
      ),
    );
  }
}
