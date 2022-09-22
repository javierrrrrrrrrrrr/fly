import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

class InfoButtom extends StatelessWidget {
  const InfoButtom({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final flipProvaider = Provider.of<FlipProvider>(context);
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: size.width * 0.8,
      color: Colors.blue,
      height: size.height * 0.075,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
        FocusManager.instance.primaryFocus?.unfocus();
        flipProvaider.checkFlip(context);
      },
      child: const Text(
        "Continue",
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
