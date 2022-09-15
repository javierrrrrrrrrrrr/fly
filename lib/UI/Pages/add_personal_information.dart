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
        body: SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Column(
              children: const [
                InfoCheckRowProgress(),
                InfoCardWIdget(),
              ],
            ),
            Positioned(
              right: size.width * 0.1,
              bottom: size.height * 0.05,
              child: const InfoBottom(),
            ),
          ],
        ),
      ),
    ));
  }
}
