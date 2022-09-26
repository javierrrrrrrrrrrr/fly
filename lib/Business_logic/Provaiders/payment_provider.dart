

import 'package:fly_cliente/UI/Widgets/widgets.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class PaymentsProvider extends ChangeNotifier {
  
   void pay(){
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-8X8MS1LfYbQgxpnPi652Pw');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _onCardNonceRequestSuccess,
       onCardEntryCancel: _onCardEntryCancel);


  }


   void _onCardNonceRequestSuccess(CardDetails result) {
    print('Este es el nonce de la carta${result.nonce}');

    InAppPayments.completeCardEntry(onCardEntryComplete: _onCardEntryComplete);
  }

   void _onCardEntryCancel() {
  }

   void _onCardEntryComplete() {
  }
}