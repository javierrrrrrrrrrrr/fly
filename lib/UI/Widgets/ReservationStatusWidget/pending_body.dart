import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/forms_providers/status_provider.dart';
import '../../../Business_logic/Provaiders/payment_provider.dart';
import '../fligthDetailWidgets/card_flight_details.dart';

class PendingBody extends StatelessWidget {
  const PendingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentprovider = Provider.of<PaymentsProvider>(context);
    final statusprovider = Provider.of<StatusProvider>(context);
    final size = MediaQuery.of(context).size;

    return ListView.builder(
        itemCount: statusprovider.payPendingResponseList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04, vertical: size.height * 0.01),
            child: CardFlightDetails(
              flight: paymentprovider.convertflightInRelationtoFlight(
                  statusprovider.payPendingResponseList[index]),
            ),
          );
        });
  }
}
