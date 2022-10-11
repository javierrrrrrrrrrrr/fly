import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/forms_providers/status_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/payment_provider.dart';
import 'package:provider/provider.dart';

import '../../../DataLayer/Models/pay_fly_response_model.dart';
import '../fligthDetailWidgets/card_flight_details.dart';

class AceptedBody extends StatelessWidget {
  const AceptedBody({Key? key, required this.payAceptedResponseList})
      : super(key: key);

  final List<PayFlyModel> payAceptedResponseList;

  @override
  Widget build(BuildContext context) {
    final paymentprovider = Provider.of<PaymentsProvider>(context);
    final statusprovider = Provider.of<StatusProvider>(context);

    return ListView.builder(
        itemCount: statusprovider.payAceptedResponseList.length,
        itemBuilder: (BuildContext context, int index) {
          return CardFlightDetails(
            flight: paymentprovider.convertflightInRelationtoFlight(
                statusprovider.payAceptedResponseList[index]),
          );
        });
  }
}
