import 'package:flutter/material.dart';

import '../../../DataLayer/Models/flight_model.dart';

class RowCheckInInfo extends StatelessWidget {
  const RowCheckInInfo({
    Key? key,
    required this.index,
    this.miniContainerGreen1,
    this.miniContainerGreen2,
    required this.padding,
    required this.selected,
  }) : super(key: key);
  final Widget? miniContainerGreen1;
  final Widget? miniContainerGreen2;
  final int index;
  final Flight selected;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: padding,
      child: Row(
        children: [
          const Text("Check in ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(selected.checkIn.trim().substring(0, 4),
              style: const TextStyle(
                fontSize: 20,
              )),
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
