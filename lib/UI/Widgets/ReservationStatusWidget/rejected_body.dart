import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/forms_providers/status_provider.dart';
import '../../../Business_logic/Provaiders/payment_provider.dart';
import '../fligthDetailWidgets/card_flight_details.dart';

class RejectedBody extends StatelessWidget {
  const RejectedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentprovider = Provider.of<PaymentsProvider>(context);
    final statusprovider = Provider.of<StatusProvider>(context);

    return ListView.builder(
        itemCount: statusprovider.payCancelResponseList.length,
        itemBuilder: (BuildContext context, int index) {
          return CardFlightDetails(
            flight: paymentprovider.convertflightInRelationtoFlight(
                statusprovider.payCancelResponseList[index]),
          );
        });
  }
}
