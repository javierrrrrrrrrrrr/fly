import 'package:flutter/material.dart';

import '../../../Constants/contants.dart';
import '../imput_field.dart';

class CustomPikedDate extends StatefulWidget {
  const CustomPikedDate({
    Key? key,
    required this.onSelectedDate,
    required this.hintText,
  }) : super(key: key);

  final String hintText;
  final void Function(DateTime value) onSelectedDate;

  @override
  State<CustomPikedDate> createState() => _CustomPikedDateState();
}

class _CustomPikedDateState extends State<CustomPikedDate> {
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Imputfield(
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          DateTime? piked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2027));

          if (piked != null) {
            widget.onSelectedDate;
            setState(() {
              selectedDate =
                  "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
            });
          }
        },
        prefixIcon: const Icon(Icons.cake, color: Colors.blue),
        hintext: selectedDate == null ? widget.hintText : selectedDate!,

        //Aqui va el action del calendar
        suffixIcon: Icon(
          Icons.calendar_month,
          color: kprimarycolor,
        ));
  }
}
