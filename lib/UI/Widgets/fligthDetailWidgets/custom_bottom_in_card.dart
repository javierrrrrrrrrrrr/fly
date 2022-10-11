import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/contact_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flight_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/login_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/payment_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/DataLayer/Models/flight_model.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flip_provider.dart';

class CustomButtomCard extends StatefulWidget {
  const CustomButtomCard({
    Key? key,
    required this.flightProvaider,
    required this.departureFlight,
  }) : super(key: key);

  final FlightProvider flightProvaider;
  final Flight departureFlight;

  @override
  State<CustomButtomCard> createState() => _CustomButtomCardState();
}

class _CustomButtomCardState extends State<CustomButtomCard> {
  @override
  Widget build(BuildContext context) {
    final flipProvider = Provider.of<FlipProvider>(context);
    final flightProvider = Provider.of<FlightProvider>(context);
    final payProvider = Provider.of<PaymentsProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    final contactProvider = Provider.of<ContactProvider>(context);

    final size = MediaQuery.of(context).size;
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      controller: flipProvider.controllerbuttomCard,
      front: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minWidth: size.width * 0.6,
          height: size.height * 0.08,
          color: widget.flightProvaider.userReturnDay == '' ||
                  loginProvider.selectedcontactIDList.isEmpty
              ? Colors.grey
              : kprimarycolor,
          onPressed: () async {
            widget.flightProvaider.userReturnDay == '' ||
                    loginProvider.selectedcontactIDList.isEmpty
                ? () {
                    //TODO: Sacar Notificacion
                  }
                : () async {
                    loadingSpinner(context);
                    bool respuesta = await flightProvider.verifyReturnFlights(
                        dateReturn: flightProvider.userReturnDay,
                        from: widget.departureFlight.from,
                        to: widget.departureFlight.to);

                    if (respuesta == true) {
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                      flipProvider.controllerBigCard.toggleCard();
                      flipProvider.controllerbuttomCard.toggleCard();
                    }
                  };
          },
          child: const Text(
            "Return Flight",
            style: TextStyle(color: Colors.white, fontSize: 26),
          )),
      back: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minWidth: size.width * 0.6,
          height: size.height * 0.08,
          color: kprimarycolor,
          onPressed: () async {
            int depatureId = flightProvider.selectedDepartureFlight!.id;
            int returnId = flightProvider.selectedReturnFlight!.id;

            List<int> id = loginProvider.selectedcontactIDList;
            loadingSpinner(context);

            bool respuesta = await payProvider.verifyFlightInfo(
                loginProvider.loggedUser!.jwt, depatureId, returnId, id);
            if (respuesta == true) {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/check_pay');
            } else {
              Navigator.pop(context);
              print("errrrrrrrorrrr");
            }

            //
            // print("$depatureId");
            // print("$returnId");
            // print("$id");

            Navigator.of(context).pushReplacementNamed('/check_pay');
          },
          child: const Text(
            "Continue",
            style: TextStyle(color: Colors.white, fontSize: 26),
          )),
    );
  }
}
