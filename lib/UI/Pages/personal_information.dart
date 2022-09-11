import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/info_buttom.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/info_card_widget.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/info_check_row_progress.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        const InfoCheckRowProgress(),
        const InfoCardWIdget(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
          child: const InfoBottom(),
        ),
      ],
    ));
  }
}
