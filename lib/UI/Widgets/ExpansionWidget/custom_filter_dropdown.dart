import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import '../../../Constants/contants.dart';
import 'dart:math' as math;

import 'search_filter.dart';

class CustomFilterDropDown extends StatelessWidget {
  const CustomFilterDropDown({
    Key? key,
    required this.expandido,
    required this.onPreesedFuntionButton,
    this.onRestoreState,
  }) : super(key: key);
  final VoidCallback onPreesedFuntionButton;
  final bool expandido;
  final bool? Function()? onRestoreState;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ExpansionWidget(
        maintainState: true,
        onRestoreState: onRestoreState,
        initiallyExpanded: expandido,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: Padding(
                //ver
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Material(
                  borderRadius:
                      BorderRadius.all(Radius.circular(size.height * 0.01)),
                  elevation: 3,
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
                            'Book Flight',
                            style:
                                TextStyle(fontSize: 22, color: kprimarycolor),
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
                ),
              ));
        },
        content: SearchFilters(
          onPreesedFuntionButton: onPreesedFuntionButton,
        ));
  }
}
