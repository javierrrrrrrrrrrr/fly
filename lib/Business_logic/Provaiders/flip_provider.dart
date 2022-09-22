import 'dart:async';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:in_app_notification/in_app_notification.dart';

import '../../UI/Widgets/notification_body.dart';

class FlipProvider extends ChangeNotifier {
  //Control del flip carta grande y botton //
  var controllerBigCard = FlipCardController();
  var controllerbuttomCard = FlipCardController();

  //Controles de fomrulario de pasos //
  bool avalible = true;
  int flip = 0;
  var controllerLine1 = FlipCardController();
  var controllerCircle1 = FlipCardController();
  var controllerLine2 = FlipCardController();
  var controllerCircle2 = FlipCardController();
  var controllerLine3 = FlipCardController();
  var controllerCircle3 = FlipCardController();
  var controllerLine4 = FlipCardController();
  var controllerCircle4 = FlipCardController();
  var controllerCircle5 = FlipCardController();

  void chnageAvalibleValor(bool val) {
    avalible = val;
    notifyListeners();
  }

  checkFlip(BuildContext context) async {
    chnageAvalibleValor(false);
    loadingSpinner(context);
    Timer(const Duration(seconds: 1), () async {
      Navigator.pop(context);
      flip++;
      notifyListeners();
      chnageAvalibleValor(true);
      if (flip == 1) {
        controllerLine1.toggleCard();
        controllerCircle1.toggleCard();
        InAppNotification.show(
            duration: const Duration(seconds: 1),
            child: const NotificationBody(texto: "Buen Comienzo"),
            context: context);
      }

      if (flip == 2) {
        controllerLine2.toggleCard();
        controllerCircle2.toggleCard();
        InAppNotification.show(
            duration: const Duration(seconds: 2),
            child: const NotificationBody(texto: "Sigue asi"),
            context: context);
      }
      if (flip == 3) {
        controllerLine3.toggleCard();
        controllerCircle3.toggleCard();
        InAppNotification.show(
            duration: const Duration(seconds: 2),
            child: const NotificationBody(texto: "Ya falta poco"),
            context: context);
      }
      if (flip == 4) {
        controllerLine4.toggleCard();
        controllerCircle4.toggleCard();
        InAppNotification.show(
            duration: const Duration(seconds: 2),
            child: const NotificationBody(texto: "Solo un paso mas"),
            context: context);
      }
      if (flip == 5) {
        controllerCircle5.toggleCard();
        InAppNotification.show(
            duration: const Duration(seconds: 1),
            child: const NotificationBody(texto: "Todo listo"),
            context: context);

        Timer(const Duration(seconds: 2), () {
          controllerLine1.controller?.dispose();
          controllerCircle1.controller?.dispose();
          controllerLine2.controller?.dispose();
          controllerCircle2.controller?.dispose();
          controllerLine3.controller?.dispose();
          controllerCircle3.controller?.dispose();
          controllerLine4.controller?.dispose();
          controllerCircle4.controller?.dispose();
          controllerCircle5.controller?.dispose();
          Navigator.of(context).pushNamed('/contacts');
          flip = 0;
        });
      }
    });
  }
}
