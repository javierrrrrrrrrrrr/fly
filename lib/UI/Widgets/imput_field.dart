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
  }) : super(key: key);

  final bool? avalible;
  final String hintext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  State<Imputfield> createState() => _ImputfieldState();
}

class _ImputfieldState extends State<Imputfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.avalible,
      onTap: widget.onTap,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
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


         
    
  


// InputDecoration inputDecoration(hinttext, bool hasicon, Widget? label,
//     Widget? counter, bool? validateIcon, var width) {
//   if (hasicon == true) {
//     return 
//   } else {
//     return InputDecoration(
//       label: label,
//       contentPadding: EdgeInsets.symmetric(
//           horizontal: width * 0.05, vertical: width * 0.025),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
//       enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color.fromRGBO(77, 82, 233, 1)),
//           borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
//       hintText: hinttext,
//       hintStyle: TextStyle(color: Colors.black54, fontSize: width * 0.05),
//     );
//   }
// }
