import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flight_provider.dart';
import '../../../Business_logic/Provaiders/flip_provider.dart';
import '../../../Business_logic/Provaiders/login_provider.dart';
import '../../../Business_logic/Provaiders/payment_provider.dart';
import '../../../Constants/contants.dart';
import '../../../DataLayer/Models/flight_model.dart';

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
                ? notificacion()
                //TODO: Sacar Notificacion

                : accion(context);
          },
          child: const Text(
            "Vuelo de retorno",
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
            "Continuar",
            style: TextStyle(color: Colors.white, fontSize: 26),
          )),
    );
  }

  void notificacion() {
    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Upss!',
        message:
            "Para continuar es  seleccione un dia de retorno y un contacto",
        contentType: ContentType.help,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  accion(BuildContext context) async {
    final flipProvider = Provider.of<FlipProvider>(context, listen: false);
    final flightProvider = Provider.of<FlightProvider>(context, listen: false);

    loadingSpinner(context);
    bool respuesta = await flightProvider.verifyReturnFlights(
        dateReturn: flightProvider.userReturnDay,
        from: widget.departureFlight.from,
        to: widget.departureFlight.to);

    if (respuesta == true) {
      Navigator.pop(context);
      flipProvider.controllerBigCard.toggleCard();
      flipProvider.controllerbuttomCard.toggleCard();
    } else {
      Navigator.pop(context);
      print("errrrrrrrorrrr");
    }
  }
}
