import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body2.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body3.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body4.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body5.dart';
import 'package:provider/provider.dart';
import 'crad_body1.dart';

class InfoCardWIdget extends StatelessWidget {
  const InfoCardWIdget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final flipProvaider = Provider.of<FlipProvider>(context);
    final size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.02),
        // height: size.height * 0.63,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: flipProvaider.flip == 0
            ? const CardBody1(
                spacenamed: false,
                firstname: "First Name",
                lastname: "Last Name",
                passengerType: "Passenger Typer",
                birthDate: "Birth Date",
                email: "Email",
                gender: "Gender",
                phone: "Phone",
              )
            : flipProvaider.flip == 1
                ? const CardBody2(
                    spacenamed: false,
                    address: "Address",
                    city: "City",
                    state: "State",
                    zipCode: "Zip Code",
                    country: "Country",
                    nationality: "Nationality")
                : flipProvaider.flip == 2
                    ? const CardBody3(
                        spacenamed: false,
                        ofacCode: "Ofac Code",
                        motherMaiden: "Mother Maiden",
                        foreignAdress: "Foreign Adress",
                        foreignCity: "Foreign City",
                        foreignprovince: "Foreign Province",
                        foreignZipCode: "Foreign Zip Code",
                        emergencyName: "Emergency Number",
                      )
                    : flipProvaider.flip == 3
                        ? const CardBody4(
                            spacenamed: false,
                            emergencyPhone: "Emergency Phone",
                            cubanFirstName: "Cuban First Name",
                            cubanLastName: "Cuban Last Name",
                            arrivalDocs: "Arrival Docs",
                            countryIssue: "Country Issue",
                            arrivalDocNo: "Arrival Doc No",
                          )
                        : const CardBody5(
                            spacenamed: false,
                            expDate: "Exp Date",
                            passportNumbersec: "Passport Number",
                            contryOfIssuesec: "Country Of Issue",
                            arrivalDocNumbersec: "Arrival Doc Number",
                            expDatesec: "Exp Date",
                          ));
  }
}
