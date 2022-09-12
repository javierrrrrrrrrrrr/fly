/*Colores*/
import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../UI/Widgets/widgets.dart';

Color kprimarycolor = const Color(0xfff003f91);
Color kiconocolor = const Color(0xfff2ebe9);
String ip = 'https://api.mirandacharters.com';

/*Metodos*/

dynamic loadingSpinner(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                color: Colors.white, size: 60));
      });
}
