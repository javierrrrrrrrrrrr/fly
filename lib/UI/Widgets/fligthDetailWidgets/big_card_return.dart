// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flight_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/DataLayer/Models/flight_model.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/flight_details_header.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/mini_container_green.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/row_card_body_from_to_info.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/row_check_in_info.dart';
import 'package:provider/provider.dart';

import '../SeparationWidget/line.dart';

class BigCardReturn extends StatelessWidget {
  const BigCardReturn({
    Key? key,
    required this.selectedReturnFlight,
  }) : super(key: key);

  final Flight? selectedReturnFlight;

  @override
  Widget build(BuildContext context) {
    final flightProvider = Provider.of<FlightProvider>(context);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.67,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.028),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    const Text(
                      "Return Flight",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    const LineSeparator(),
                    SizedBox(
                      //width: size.width * 0.3,
                      height: size.height * 0.13,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.04,
                        ),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () =>
                                flightProvider.updateSelectedFlight(index),
                            child: Padding(
                              padding: flightProvider.returnflights.length == 1
                                  ? EdgeInsets.symmetric(
                                      horizontal: size.width * 0.25)
                                  : const EdgeInsets.symmetric(horizontal: 0),
                              child: SizedBox(
                                width: size.width * 0.26,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    flightProvider.returnflights.isNotEmpty
                                        ? Text(
                                            " ${flightProvider.returnflights[index].day.substring(0, 3)},${flightProvider.convertDayMonthToLeterDay(flightProvider.returnflights[index].date).substring(0, 3)} ${flightProvider.returnflights[index].date.substring(flightProvider.returnflights[index].date.length - 2, flightProvider.returnflights[index].date.length)} ",
                                            style: flightProvider
                                                        .returnflights[index] ==
                                                    flightProvider
                                                        .selectedReturnFlight
                                                ? const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold)
                                                : const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                          )
                                        : const Text(''),
                                    Text('\$0.00',
                                        style: flightProvider
                                                    .returnflights[index] ==
                                                flightProvider
                                                    .selectedReturnFlight
                                            ? const TextStyle(
                                                fontSize: 16,
                                                color: Colors.green)
                                            : const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => Container(
                              width: size.width * 0.002,
                              color: const Color.fromRGBO(155, 155, 155, 1)),
                          itemCount: flightProvider.returnflights.length,
                        ),
                      ),
                    ),
                    const LineSeparator(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    FlightDetailsHeader(
                      flight: selectedReturnFlight!,
                      lastRowWidget: flightProvider.returnflights.isNotEmpty
                          ? SizedBox(
                              height: size.height * 0.05,
                              width: size.width * 0.2,
                              child: Center(
                                child: Text(
                                  //TODO:problema con el index al buscar y volver a buscar pq no se vacia el arreglo
                                  " ${flightProvider.selectedReturnFlight!.day.substring(0, 3)},${flightProvider.convertDayMonthToLeterDay(flightProvider.selectedReturnFlight!.date).substring(0, 3)} ${flightProvider.selectedReturnFlight!.date.substring(flightProvider.selectedReturnFlight!.date.length - 2, flightProvider.selectedReturnFlight!.date.length)} ",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            )
                          : const Text(''),
                    ),
                    const LineSeparator(),
                    //TODO:Revisar despues lo de Cambiar el index por Selected Fligt y en este caso el index del que viene del modelo

                    RowCardBodyFromToInfo(
                      selected: flightProvider.selectedReturnFlight!,
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    const LineSeparator(),
                    RowCheckInInfo(
                      selected: flightProvider.selectedReturnFlight!,
                      padding: EdgeInsets.only(
                          left: size.width * 0.02,
                          top: size.height * 0.02,
                          bottom: size.height * 0.02),
                      miniContainerGreen2: MiniContainerGreen(
                          icono: true, valor: selectedReturnFlight!.openSeats),
                    ),
                    const LineSeparator(),
                  ],
                ),
                Positioned(
                  bottom: size.height * 0.05,
                  left: size.width * 0.12,
                  child: SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.6,
                      child: Image.asset('assets/flightNumber.png')),
                ),
                Positioned(
                  bottom: size.height * 0.055,
                  left: size.width * 0.31,
                  child: Text(
                    selectedReturnFlight!.flightNumber,
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            left: size.width * 0.02,
            bottom: size.height * 0.5,
            child: Icon(
              Icons.arrow_back_ios,
              color: kprimarycolor,
              size: 28,
            )),
        Positioned(
            right: size.width * 0.005,
            bottom: size.height * 0.5,
            child: Icon(
              Icons.arrow_forward_ios,
              color: kprimarycolor,
              size: 28,
            )),
      ],
    );
  }
}
