import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Constants/contants.dart';
import '../../Widgets/PerosnalInfoWidgets/info_buttom.dart';
import '../../Widgets/PerosnalInfoWidgets/info_card_widget.dart';
import '../../Widgets/PerosnalInfoWidgets/info_check_row_progress.dart';

class CreateContactPage extends StatelessWidget {
  const CreateContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kprimarycolor));
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const InfoCheckRowProgress(),
              const InfoCardWIdget(),
              Container(
                height: size.height * 0.035,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.01),
                child: const InfoButtom(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
