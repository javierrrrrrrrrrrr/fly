import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key,
      required this.items,
      this.onChanged,
      this.onSaved,
      required this.hintext,
      this.itemPadding,
      this.contentPadding,
      this.iconData, this.value})
      : super(key: key);

  final List<String>? items;
  final void Function(Object?)? onChanged;
  final void Function(Object?)? onSaved;
  final String hintext;
  final EdgeInsetsGeometry? itemPadding;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? iconData;
  final Object? value;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        DropdownButtonFormField2(
          value:widget.value,
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            contentPadding: widget.contentPadding ?? EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
          ),
          isExpanded: true,
          hint: Text(
            widget.hintext,
            style: const TextStyle(fontSize: 14),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 25,
          buttonHeight: 50,

          // dropdownPadding: widget.dropdownPadding,
          buttonPadding: const EdgeInsets.only(left: 10, right: 10),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          items: widget.items!
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select';
            }
            return null;
          },
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
        ),
        Positioned(
            left: size.width * 0.03,
            top: size.height * 0.015,
            child: widget.iconData == null
                ? Container()
                : Icon(widget.iconData, color: Colors.blue)),
      ],
    );
  }
}
