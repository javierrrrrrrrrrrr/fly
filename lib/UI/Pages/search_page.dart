import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/ExpansionWidget/custom_dropdown.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/flight_provider.dart';
import '../Widgets/app_background_selection.dart';
import '../Widgets/CustomWidget/custom_appbar_row.dart';
import '../Widgets/CustomWidget/custom_drawer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);
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
              body: Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SingleChildScrollView(
                        child: CustomFilterDropDown(
                      expandido: true,
                      onPreesedFuntionButton: () => onPressedButton(context),
                    )),
                  ),
                ),
              )),
        ));
  }

  void onPressedButton(BuildContext context) async {
    final flightProvaider = Provider.of<FlightProvider>(context, listen: false);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    /**Logica de las busqueda */
    flightProvaider.addtoBody();
    bool respuesta = await flightProvaider.getFlightsBy();

    if (respuesta == true) {
      flightProvaider.cleanValues();

      Navigator.pop(context);
      flightProvaider.cleanIsselectedDays();
      Navigator.of(context).pushNamed('/result');
    } else {
      /*Mostrar al Usaqrio el error */
      Navigator.pop(context);
    }
  }
}
