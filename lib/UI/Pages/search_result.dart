import 'package:flutter/material.dart';
import '../../Constants/contants.dart';
import '../Widgets/CustomWidget/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/flight_provider.dart';
import '../Widgets/ExpansionWidget/custom_filter_dropdown.dart';
import '../Widgets/fligthDetailWidgets/card_flight_details.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool? isExpandedDropdown;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flightProvaider = Provider.of<FlightProvider>(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomFilterDropDown(
                    onRestoreState: () {
                      return flightProvaider.isExpanded;
                    },
                    //esto no importa
                    expandido: false,
                    onPreesedFuntionButton: () {
                      flightProvaider.changevalue(false);

                      setState(() {});
                      onPressedButton(context);
                    }),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  '${flightProvaider.departureflights.length} Results',
                  style: TextStyle(fontSize: 20, color: kprimarycolor),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 1)),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: flightProvaider.departureflights.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.03,
                              left: size.height * 0.003,
                              right: size.height * 0.003,
                            ),
                            child: CardFlightDetails(
                              flight: flightProvaider.departureflights[index],
                            ));
                      },
                    ),
                  ),
                )
              ],
            ),
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
      //flightProvaider.changevalue(false);
      flightProvaider.cleanIsselectedDays();
      //  flightProvaider.isepandedDropDown = false;

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      /*Mostrar al Usaqrio el error */
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
