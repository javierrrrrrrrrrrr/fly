import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/login_provider.dart';
import 'package:fly_cliente/DataLayer/Models/flight_model.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/flight_details_header.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/mini_container_green.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/row_card_body_from_to_info.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/vertical_discontinuos_line.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import '../SeparationWidget/line.dart';
import '../imput_field.dart';
import 'row_check_in_info.dart';

class BigCardDeparture extends StatelessWidget {
  const BigCardDeparture({
    Key? key,
    required this.flightProvaider,
    required this.departureflight,
  }) : super(key: key);

  final FlightProvider flightProvaider;
  final Flight departureflight;

  @override
  Widget build(BuildContext context) {
    final flightProvider = Provider.of<FlightProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);

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
                flight: departureflight,
                lastRowWidget: Row(
                  children: [
                    Text(departureflight.day.substring(0, 3).toUpperCase()),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              const Line(),
              RowCardBodyFromToInfo(
                selected: departureflight,
              ),
              SizedBox(
                height: size.height * 0.022,
              ),
              const Line(),
              RowCheckInInfo(
                selected: departureflight,
                padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    top: size.height * 0.02,
                    bottom: size.height * 0.02),
                miniContainerGreen1: MiniContainerGreen(
                    valor: departureflight.adultPrice.toString()),
                miniContainerGreen2: MiniContainerGreen(
                    icono: true, valor: departureflight.openSeats),
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
                                departureflight.date),
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
                        price: departureflight.adultPrice.toString()),
                    const VerticalDiscontinuosLine(),
                    PriceColumn(
                        icon: Icons.family_restroom,
                        person: "Child",
                        price: departureflight.childPrice.toString()),
                    const VerticalDiscontinuosLine(),
                    PriceColumn(
                        icon: Icons.child_friendly_rounded,
                        person: "Infant",
                        price: departureflight.boysPrice.toString()),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.02),
                  child: DropdownButton(
                      onChanged: ((value) {}),
                      items: loginProvider.contactNamesList.map((item) {
                        return DropdownMenuItem<String>(
                            value: item,
                            child: Row(
                              children: [
                                Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                              ],
                            ));
                      }).toList())

                  // CustomDropDown(
                  //   onChanged: (value) {

                  //   },
                  //   items: loginProvider.contactNamesList,
                  //   hintext: 'Contacts',
                  // ),
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
              departureflight.flightNumber,
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
