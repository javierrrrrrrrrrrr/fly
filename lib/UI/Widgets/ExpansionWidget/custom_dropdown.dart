import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'dart:math' as math;

import 'package:fly_cliente/UI/Widgets/ExpansionWidget/search_filter.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.expandido,
  }) : super(key: key);

  final bool expandido;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ExpansionWidget(
        initiallyExpanded: expandido,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: Padding(
                //ver
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(size.height * 0.01))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.09),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'Schedule',
                          style: TextStyle(fontSize: 22, color: kprimarycolor),
                        )),
                        Transform.rotate(
                          angle: math.pi * animationValue / 2,
                          alignment: Alignment.center,
                          child: const Icon(Icons.arrow_right, size: 40),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
        content: const SearchFilters());
  }
}
