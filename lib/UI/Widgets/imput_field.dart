import 'package:flutter/material.dart';

class Imputfield extends StatefulWidget {
  const Imputfield({
    Key? key,
    required this.hintext,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.avalible,
    this.onTap,
    this.initialValue,
    this.keyboardType,
  }) : super(key: key);

  final bool? avalible;
  final String hintext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  final String? initialValue;

  final TextInputType? keyboardType;

  @override
  State<Imputfield> createState() => _ImputfieldState();
}

class _ImputfieldState extends State<Imputfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      enabled: widget.avalible,
      onTap: widget.onTap,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor entre algún texto';
            }
            return null;
          },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(155, 155, 155, 0.5)),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: widget.hintext,
          hintStyle: const TextStyle(color: Colors.black54, fontSize: 15)),
    );
  }
}


         
    
  


