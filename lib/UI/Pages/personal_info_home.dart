import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';

import '../Widgets/CustomWidget/custom_circle_avatar.dart';

class PersonalInfoHome extends StatelessWidget {
  const PersonalInfoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1,
              horizontal: size.width * 0.05,
            ),
            child: const AppBarCustom(),
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/PersonalInfo');
            },
            child: Icon(
              Icons.group_add_outlined,
              size: 100,
              color: kprimarycolor,
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.8,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
                child: const Text(
                  "Add my personal information",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.navigate_before,
            size: 40,
            color: kprimarycolor,
          ),
        ),
        const CustomCircleAvatar()
      ],
    );
  }
}
