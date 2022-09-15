import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/CustomWidget/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/flight_provider.dart';
import '../Widgets/ExpansionWidget/custom_dropdown.dart';
import '../Widgets/fligthDetailWidgets/card_flight_details.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    final size = MediaQuery.of(context).size;
    final flightProvaider = Provider.of<FlightProvider>(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/fondo.jpg',
                ),
                fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomFilterDropDown(
                  expandido: false,
                  onPreesedFuntionButton: () {
                    onPressedButton(context);
                  }),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: flightProvaider.departureflights.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.03),
                        child: CardFlightDetails(index: index));
                  },
                ),
              )
            ],
          ),
        ),
      ),
      //   padding: EdgeInsets.only(
      //       left: size.width * 0.03,
      //       right: size.width * 0.03,
      //       top: size.height * 0.03),
      // ),
    );
  }

  void onPressedButton(BuildContext context) async {
    final flightProvaider = Provider.of<FlightProvider>(context, listen: false);
    loadingSpinner(context);
    /**Logica de las busqueda */
    flightProvaider.addtoBody();
    bool respuesta = await flightProvaider.getFlightsByFilters();

    if (respuesta == true) {
      flightProvaider.cleanValues();

      flightProvaider.cleanIsselectedDays();
      flightProvaider.isepandedDropDown = false;
      Navigator.pop(context);
    } else {
      /*Mostrar al Usaqrio el error */
      Navigator.pop(context);
    }
  }
}
