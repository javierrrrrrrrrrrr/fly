import 'package:flutter/material.dart';

import '../Widgets/ExpansionWidget/custom_dropdown.dart';
import '../Widgets/fligthDetailWidgets/card_flight_details.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/fondo.jpg',
                ),
                fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              const CustomDropDown(
                expandido: false,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.03),
                        child: const CardFlightDetails());
                  },
                ),
              )
            ],
          ),
        ),
      ),
      //   padding: EdgeInsets.only(
      //       left: size.width * 0.03,
      //       right: size.width * 0.03,
      //       top: size.height * 0.03),
      // ),
    );
  }
}
