import 'dart:async';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';

import '../../UI/Widgets/notification_body.dart';

class FlipProvider extends ChangeNotifier {
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

  checkFlip(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    var tiempo = Timer(const Duration(seconds: 1), () async {
      Navigator.pop(context);
      flip++;
      notifyListeners();

      if (flip == 1) {
        controllerLine1.toggleCard();
        controllerCircle1.toggleCard();
        InAppNotification.show(
            duration: const Duration(seconds: 2),
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
            duration: const Duration(seconds: 2),
            child: const NotificationBody(texto: "Todo listo"),
            context: context);
      }
      // if (flip > 5) {
      //   flip = 0;
      // }
    });
  }
}
