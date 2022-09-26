import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/contact_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/login_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body1.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body2.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body4.dart';
import 'package:fly_cliente/UI/Widgets/PerosnalInfoWidgets/crad_body5.dart';
import 'package:provider/provider.dart';

import '../../Widgets/CustomWidget/custom_circle_avatar.dart';
import '../../Widgets/PerosnalInfoWidgets/crad_body3.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final contactProvider = Provider.of<ContactProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          SingleChildScrollView(
            child: BodyCustom(
                body: CardBody1(
              selectedContact: contactProvider.selectedContact,
              space: 40,
              firstname: contactProvider.selectedContact!.firstName,
              lastname: contactProvider.selectedContact!.lastName,
              passengerType: contactProvider.selectedContact!.passengerType,
              birthDate: contactProvider.selectedContact!.birthDate!,
              gender: contactProvider.selectedContact!.gender!,
              email: contactProvider.selectedContact!.email!,
              phone: contactProvider.selectedContact!.phone!,
            )),
          ),
          SingleChildScrollView(
            child: BodyCustom(
                body: CardBody2(
              address: contactProvider.selectedContact!.address!,
              city: contactProvider.selectedContact!.city!,
              state: contactProvider.selectedContact!.state!,
              zipCode: contactProvider.selectedContact!.zip!,
              country: contactProvider.selectedContact!.country!,
              nationality: contactProvider.selectedContact!.nationality!,
              space: 40,
            )),
          ),
          SingleChildScrollView(
            child: BodyCustom(
                body: CardBody3(
              ofacCode: contactProvider.selectedContact!.ofacCode!,
              motherMaiden: contactProvider.selectedContact!.mothersMaiden!,
              foreignAdress: contactProvider.selectedContact!.foreignAddress!,
              foreignCity: contactProvider.selectedContact!.foreignCity!,
              foreignprovince:
                  contactProvider.selectedContact!.foreignProvince!,
              emergencyName: contactProvider.selectedContact!.emergencyPhone!,
              foreignZipCode: contactProvider.selectedContact!.foreignZip!,
              space: 40,
            )),
          ),
          SingleChildScrollView(
            child: BodyCustom(
                body: CardBody4(
              emergencyPhone: contactProvider.selectedContact!.emergencyPhone!,
              cubanFirstName: contactProvider.selectedContact!.cubanFirstName!,
              cubanLastName: contactProvider.selectedContact!.cubanLastName!,
              arrivalDocs: contactProvider.selectedContact!.arrivalDoc!,
              countryIssue: contactProvider.selectedContact!.countryOfIssue!,
              arrivalDocNo: contactProvider.selectedContact!.arrivalDocNo!,
              space: 40,
            )),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BodyCustom(
                    body: CardBody5(
                  expDate: contactProvider.selectedContact!.expDate!,
                  passportNumbersec:
                      contactProvider.selectedContact!.passportNumberSec!,
                  contryOfIssuesec:
                      contactProvider.selectedContact!.countryOfIssueSec!,
                  arrivalDocNumbersec:
                      contactProvider.selectedContact!.arrivalDocNoSec!,
                  expDatesec: contactProvider.selectedContact!.expDateSec!,
                  space: 40,
                )),
                MaterialButton(
                  onPressed: () {
                    contactProvider.updateContact(
                        contact: contactProvider.selectedContact!,
                        token: loginProvider.loggedUser!.jwt);
                   
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.02)),
                  height: size.height * 0.07,
                  minWidth: size.width * 0.5,
                  color: kprimarycolor,
                  child: const Text(
                    'Update Contact',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BodyCustom extends StatelessWidget {
  const BodyCustom({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.9,
          width: size.width,
        ),
        Positioned(
          top: size.height * 0.1,
          left: size.width * 0.05,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              // color: Colors.white,
              //  height: size.height * 0.87,
              width: size.width * 0.9,
              child: body),
        ),
      ],
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
