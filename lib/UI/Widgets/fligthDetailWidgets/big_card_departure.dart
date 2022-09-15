import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/flight_details_header.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/mini_container_green.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/row_card_body_from_to_info.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/vertical_discontinuos_line.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../SeparationWidget/line.dart';
import '../imputField.dart';
import 'row_check_in_info.dart';

class BigCardDeparture extends StatelessWidget {
  const BigCardDeparture({
    Key? key,
    required this.flightProvaider,
    required this.index,
  }) : super(key: key);

  final FlightProvider flightProvaider;
  final int index;

  @override
  Widget build(BuildContext context) {
    final flightProvider = Provider.of<FlightProvider>(context);

    final size = MediaQuery.of(context).size;
    return Container(
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
      child: Stack(
        children: [
          Column(
            children: [
              FlightDetailsHeader(
                flight: flightProvider.departureflights[index],
                lastRowWidget: Row(
                  children: [
                    Text(flightProvider.departureflights[index].day
                        .substring(0, 3)
                        .toUpperCase()),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              const Line(),
              RowCardBodyFromToInfo(
                selected: flightProvider.departureflights[index],
              ),
              SizedBox(
                height: size.height * 0.022,
              ),
              const Line(),
              RowCheckInInfo(
                selected: flightProvider.departureflights[index],
                padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    top: size.height * 0.02,
                    bottom: size.height * 0.02),
                index: index,
                miniContainerGreen1: MiniContainerGreen(
                    valor: flightProvider.departureflights[index].adultPrice
                        .toString()),
                miniContainerGreen2: MiniContainerGreen(
                    icono: true,
                    valor: flightProvider.departureflights[index].openSeats),
              ),
              const Line(),
              Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /**Faltan datos en la consulta */
                    Column(
                      children: [
                        const Text(
                          'Depature Day',
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.005),
                          child: Text(
                            flightProvaider.convertDayMonthToLeterDay(
                                flightProvaider.departureflights[index].date),
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                        const Text(
                          'Thuesday',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Return Day",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                          width: size.width * 0.24,
                          child: Imputfield(
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DateTime? piked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2027));

                                if (piked != null) {
                                  flightProvider.changeuserReturnDay(
                                      "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}");
                                }
                              },
                              hintext: flightProvider.userReturnDay,
                              suffixIcon: flightProvider.userReturnDay == ""
                                  ? const Icon(Icons.calendar_month,
                                      color: Colors.blue)
                                  : null),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: const Line(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.008),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceColumn(
                        icon: Icons.accessibility_new_outlined,
                        person: "Adult",
                        price: flightProvider.departureflights[index].adultPrice
                            .toString()),
                    const VerticalDiscontinuosLine(),
                    PriceColumn(
                        icon: Icons.family_restroom,
                        person: "Child",
                        price: flightProvider.departureflights[index].childPrice
                            .toString()),
                    const VerticalDiscontinuosLine(),
                    PriceColumn(
                        icon: Icons.child_friendly_rounded,
                        person: "Infant",
                        price: flightProvider.departureflights[index].boysPrice
                            .toString()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.02),
                child: const CustomDropDown(
                  items: [],
                  hintext: 'Contacts',
                ),
              ),
            ],
          ),
          Positioned(
            bottom: size.height * 0.23,
            left: size.width * 0.22,
            child: SizedBox(
                height: size.height * 0.08,
                width: size.width * 0.45,
                child: Image.asset('assets/flightNumber.png')),
          ),
          Positioned(
            bottom: size.height * 0.24,
            left: size.width * 0.33,
            child: Text(
              flightProvider.departureflights[index].flightNumber,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class PriceColumn extends StatelessWidget {
  const PriceColumn({
    Key? key,
    required this.price,
    required this.person,
    required this.icon,
  }) : super(key: key);

  final String price;
  final String person;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            Text(
              person,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        Text(
          "\$$price",
          style: const TextStyle(fontSize: 28, color: Colors.green),
        ),
      ],
    );
  }
}
