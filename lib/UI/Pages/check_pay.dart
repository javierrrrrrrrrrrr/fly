import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Business_logic/Provaiders/forms_providers/status_provider.dart';
import '../../Business_logic/Provaiders/payment_provider.dart';
import '../../Constants/contants.dart';
import '../Widgets/fligthDetailWidgets/card_flight_details.dart';
import '../Widgets/fligthDetailWidgets/horizontal_discontinuos_line.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/login_provider.dart';
import '../../DataLayer/Models/flight_model.dart';

class CheckPay extends StatelessWidget {
  const CheckPay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentsProvider>(context);

    return Container(
      color: kprimarycolor,
      child: SafeArea(
        child: _CheckPayBody(
          departureFlight: paymentProvider
              .convertflightInRelationtoFlight(paymentProvider.payResponse!),
          returnFlight: paymentProvider.convertflightOutRelationtoFlight(),
        ),
      ),
    );
  }
}

class _CheckPayBody extends StatelessWidget {
  const _CheckPayBody({
    Key? key,
    required this.departureFlight,
    required this.returnFlight,
  }) : super(key: key);

  final Flight departureFlight;
  final Flight returnFlight;

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentsProvider>(context);
    final statusProvider = Provider.of<StatusProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.03),
          child: paymentProvider.isLoadingPay == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _BackButton(),
                    SizedBox(height: size.height * 0.015),
                    CardFlightDetails(
                      customtext: "Vuelo",
                      isCheckedPage: true,
                      flight: departureFlight,
                    ),
                    SizedBox(height: size.height * 0.015),
                    CardFlightDetails(
                      customtext: 'Vuelo de Retorno',
                      isCheckedPage: true,
                      flight: returnFlight,
                    ),
                    SizedBox(height: size.height * 0.015),
                    const _ContactList(),
                    SizedBox(height: size.height * 0.015),
                    const PriceCard(),
                    SizedBox(height: size.height * 0.03),
                    Center(
                        child: MaterialButton(
                            height: size.height * 0.06,
                            minWidth: size.width * 0.6,
                            color: kprimarycolor,
                            onPressed: () async {
                              final payProvider = Provider.of<PaymentsProvider>(
                                  context,
                                  listen: false);
                              final loginProvider = Provider.of<LoginProvider>(
                                  context,
                                  listen: false);

                              final token = loginProvider.loggedUser!.jwt;
                              payProvider.token = token;
                              payProvider.pay();
                              payProvider.isLoadingPay = true;
                              //  navegar a HomePage
                              //intervalo de 3 seundos
                            },
                            child: const Text(
                              "Pagar Ahora",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )))
                  ],
                )
              : Center(
                  child: paymentProvider.iscompleted == false
                      ? Column(
                          children: [
                            Text(
                              "Procesando el Pago",
                              style: TextStyle(fontSize: size.height * 0.04),
                            ),
                            SizedBox(
                              height: size.height * 0.3,
                            ),
                            Container(
                              height: size.height * 0.2,
                              width: size.width * 0.95,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.grey,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: Center(
                                  child: Text(
                                    "Sus datos se han recibido de manera satifactoria y estamos listos para procesar su pedido esta es la ultima confirmacion precione continuar o cancelar ",
                                    style: TextStyle(
                                        fontSize: size.height * 0.025),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.3,
                            ),
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                height: size.height * 0.06,
                                minWidth: size.width * 0.6,
                                color: kprimarycolor,
                                child: Text("Continuar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.03)),
                                onPressed: () async {
                                  loadingSpinner(context);

                                  bool respuesta =
                                      await paymentProvider.makepayment(
                                          paymentProvider.token,
                                          paymentProvider.payResponse!.id);

                                  if (respuesta == true) {
                                    Navigator.pop(context);
                                    paymentProvider.iscompeted(true);
                                  } else {
                                    Navigator.pop(context);
                                  }
                                }),
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              "Completado",
                              style: TextStyle(fontSize: size.height * 0.06),
                            ),
                            SizedBox(
                                // color: Colors.blue,
                                height: size.height * 0.65,
                                width: size.width,
                                child: Lottie.asset(
                                  "assets/112147-pay-now.json",
                                )),
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                height: size.height * 0.06,
                                minWidth: size.width * 0.6,
                                color: kprimarycolor,
                                child: Text("Ir a la página principal",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.03)),
                                onPressed: () async {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                  Timer(const Duration(seconds: 3), () {
                                    paymentProvider.changeValuePay(false);
                                    paymentProvider.iscompeted(false);
                                  });
                                }),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                height: size.height * 0.06,
                                minWidth: size.width * 0.6,
                                color: kprimarycolor,
                                child: Text("Verificar pago",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.03)),
                                onPressed: () async {
                                  loadingSpinner(context);

                                  bool respuesta =
                                      await statusProvider.getInfoStatus(
                                          loginProvider.loggedUser!.jwt);

                                  if (respuesta == true) {
                                    Navigator.of(context).pop();
                                    Navigator.of(context)
                                        .pushNamed('/check_reservation_status');
                                    Timer(const Duration(seconds: 3), () {
                                      paymentProvider.changeValuePay(false);
                                      paymentProvider.iscompeted(false);
                                    });
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                }),
                          ],
                        ),
                ),
        ),
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  const PriceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentProvider = context.read<PaymentsProvider>();
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.18,
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
        padding: EdgeInsets.only(
          left: size.width * 0.025,
          right: size.width * 0.025,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                bottom: size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total",
                    style: TextStyle(fontSize: 20, color: kprimarycolor),
                  ),
                  Text(
                    '\$ ${paymentProvider.payResponse!.subtotal.toString()}',
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ],
              ),
            ),
            const HorizontalDiscontinuosLine(),
            Padding(
              padding: EdgeInsets.only(
                bottom: size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Taxes",
                    style: TextStyle(fontSize: 20, color: kprimarycolor),
                  ),
                  Text(
                    '\$ ${paymentProvider.payResponse!.fees.toString()}',
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ],
              ),
            ),
            const HorizontalDiscontinuosLine(),
            Padding(
              padding: EdgeInsets.only(
                bottom: size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20, color: kprimarycolor),
                  ),
                  Text(
                    '\$ ${paymentProvider.payResponse!.total.toString()}',
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactList extends StatelessWidget {
  const _ContactList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paymentProvider = context.read<PaymentsProvider>();
    return Container(
      height: size.height * 0.21,
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
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.02),
              child: const Text(
                'Contactos',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: const HorizontalDiscontinuosLine(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: paymentProvider.payResponse!.bookingsContacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                          width: size.width * 0.2,
                          // color: Colors.red,
                          child: Text(
                            paymentProvider.payResponse!.bookingsContacts[index]
                                .contact.firstName,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                          width: size.width * 0.2,
                          //color: Colors.red,
                          child: Row(
                            children: [
                              const Icon(Icons.emoji_people_sharp),
                              Text(
                                paymentProvider
                                    .payResponse!
                                    .bookingsContacts[index]
                                    .contact
                                    .passengerType,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // color: Colors.red,
                          height: size.height * 0.03,
                          width: size.width * 0.2,
                          child: Center(
                            child: Text(
                              paymentProvider
                                              .payResponse!
                                              .bookingsContacts[index]
                                              .contact
                                              .passengerType ==
                                          "Adulto" ||
                                      paymentProvider
                                              .payResponse!
                                              .bookingsContacts[index]
                                              .contact
                                              .passengerType ==
                                          "Niño"
                                  ? "\$ ${paymentProvider.payResponse!.flightOutRelation.adultPrice}"
                                  : "\$ ${paymentProvider.payResponse!.flightOutRelation.boysPrice}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        size: 28,
        color: kprimarycolor,
      ),
    );
  }
}
