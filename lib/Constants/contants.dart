/*Colores*/
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../UI/Widgets/widgets.dart';

// ignore: use_full_hex_values_for_flutter_colors
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

dynamic confirmDialog(contexto) {
  final size = MediaQuery.of(contexto).size;
  return showDialog(
    context: contexto,
    builder: (context) => AlertDialog(
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Confirm ',
          style: TextStyle(color: kprimarycolor, fontSize: 24),
        ),
        Icon(
          Icons.airplane_ticket,
          color: kprimarycolor,
        )
      ]),
      content: const Text(
        "Do you want to buy now?",
        style: TextStyle(fontSize: 21),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        const Icon(Icons.check_circle_outline, color: Colors.green, size: 40),
        SizedBox(
          width: size.width * 0.08,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.cancel_outlined, color: Colors.red, size: 40),
        )
      ],
      actionsPadding: EdgeInsets.only(bottom: size.height * 0.020),
    ),
  );
}
