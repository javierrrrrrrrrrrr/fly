// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flight_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/flight_details_header.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/mini_container_green.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/row_card_body_from_to_info.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/row_check_in_info.dart';
import 'package:provider/provider.dart';

import '../SeparationWidget/line.dart';

class BigCardReturn extends StatelessWidget {
  const BigCardReturn({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);
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
                    const Line(),
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
                          //TODO:Falta hacer un ternario para ver como devolver cuando existe la fecha de retorno que introduce el usario
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              flightProvaider
                                  .setindexselectedFlightReturn(index);
                            },
                            child: SizedBox(
                              width: size.width * 0.26,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  flightProvaider.returnflights.isNotEmpty
                                      ? Text(
                                          " ${flightProvaider.returnflights[index].day.substring(0, 3)},${flightProvaider.convertDayMonthToLeterDay(flightProvaider.returnflights[index].date).substring(0, 3)} ${flightProvaider.returnflights[index].date.substring(flightProvaider.returnflights[index].date.length - 2, flightProvaider.returnflights[index].date.length)} ",
                                          style: flightProvaider
                                                      .indexselectedFlightReturn ==
                                                  index
                                              ? const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green)
                                              : const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                        )
                                      : const Text(''),
                                  Text('\$0.00',
                                      style: flightProvaider
                                                  .indexselectedFlightReturn ==
                                              index
                                          ? const TextStyle(
                                              fontSize: 16, color: Colors.green)
                                          : const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black))
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => Container(
                              width: size.width * 0.002,
                              color: const Color.fromRGBO(155, 155, 155, 1)),
                          itemCount: flightProvaider.returnflights.length,
                        ),
                      ),
                    ),
                    const Line(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    FlightDetailsHeader(
                      flight: flightProvaider.departureflights[index],
                      lastRowWidget: flightProvaider.returnflights.isNotEmpty
                          ? SizedBox(
                              height: size.height * 0.05,
                              width: size.width * 0.2,
                              child: Center(
                                child: Text(
                                  " ${flightProvaider.returnflights[index].day.substring(0, 3)},${flightProvaider.convertDayMonthToLeterDay(flightProvaider.returnflights[index].date).substring(0, 3)} ${flightProvaider.returnflights[index].date.substring(flightProvaider.returnflights[index].date.length - 2, flightProvaider.returnflights[index].date.length)} ",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            )
                          : const Text(''),
                    ),
                    const Line(),
                    //TODO:Revisar despues lo de Cambiar el index por Selected Fligt y en este caso el index del que viene del modelo

                    RowCardBodyFromToInfo(
                      selected: flightProvaider.returnflights[
                          flightProvaider.indexselectedFlightReturn],
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    const Line(),
                    RowCheckInInfo(
                      selected: flightProvaider.returnflights[
                          flightProvaider.indexselectedFlightReturn],
                      padding: EdgeInsets.only(
                          left: size.width * 0.02,
                          top: size.height * 0.02,
                          bottom: size.height * 0.02),
                      index: flightProvaider.indexselectedFlightReturn,
                      miniContainerGreen2: MiniContainerGreen(
                          icono: true,
                          valor:
                              flightProvaider.returnflights[index].openSeats),
                    ),
                    const Line(),
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
                    flightProvaider.returnflights[index].flightNumber,
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
