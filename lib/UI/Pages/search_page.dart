import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/ExpansionWidget/custom_dropdown.dart';

import '../Widgets/app_background_selection.dart';
import '../Widgets/CustomWidget/custom_appbar_row.dart';
import '../Widgets/CustomWidget/custom_drawer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: AppBackgroundSelection(
              padding: EdgeInsets.only(
                left: size.width * 0.06,
                top: size.height * 0.05,
                right: size.width * 0.06,
              ),
              customAppBar: const AppBarRow(),
              body: const Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomDropDown(expandido: true),
                  ),
                ),
              )),
        ));
  }
}
