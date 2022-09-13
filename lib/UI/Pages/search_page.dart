import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
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
                top: size.height * 0.02,
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
    bool respuesta;
    final flightProvaider = Provider.of<FlightProvider>(context, listen: false);
    loadingSpinner(context);
    /**Logica de las busqueda */

    if (flightProvaider.flightNumber == "" &&
        flightProvaider.dateFrom == '' &&
        flightProvaider.dateTo == '' &&
        flightProvaider.selectedCharter == '' &&
        flightProvaider.selectedRouteFrom == '' &&
        flightProvaider.selectedRouteTo == '' &&
        flightProvaider.selectedWeekDay == '' &&
        flightProvaider.selectedGate == '') {
      respuesta = await flightProvaider.getFlights();
    } else {
      flightProvaider.addtoBody();
      respuesta = await flightProvaider.getFlightsBy();
    }

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
