import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../../../Constants/contants.dart';
import '../imput_field.dart';

class CustomPikedDate extends StatefulWidget {
  const CustomPikedDate({
    Key? key,
    required this.onSelectedDate,
    required this.hintText, this.initialvalue,

  }) : super(key: key);

  final String hintText;
  final String? initialvalue;
  final void Function(DateTime value) onSelectedDate;

  @override
  State<CustomPikedDate> createState() => _CustomPikedDateState();
}

class _CustomPikedDateState extends State<CustomPikedDate> {
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    final contactFormProvider = Provider.of<ContactFormProvider>(context);
    return Imputfield(
      initialValue: widget.initialvalue,
        validator: (value) {
          if (value == null) {
            return 'Por favor seleciona una fecha válida';
          } else {
            return null;
          }

          //validar el campo
        },
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          DateTime? piked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2027));

          if (piked != null) {
            widget.onSelectedDate(piked);

            String x =
                "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
            selectedDate = contactFormProvider.changestate(x);
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
