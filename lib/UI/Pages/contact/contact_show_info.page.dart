import 'package:flutter/material.dart';
import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/login_provider.dart';
import '../../../Constants/contants.dart';
import '../../Widgets/PerosnalInfoWidgets/card_body1.dart';

import '../../Widgets/PerosnalInfoWidgets/card_body4.dart';
import '../../Widgets/PerosnalInfoWidgets/card_body5.dart';
import 'package:provider/provider.dart';

import '../../Widgets/CustomWidget/custom_circle_avatar.dart';
import '../../Widgets/PerosnalInfoWidgets/card_body3.dart';
import '../../Widgets/PerosnalInfoWidgets/crad_body2.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final contactProvider = Provider.of<ContactProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    PageController controller =
        PageController(initialPage: 0, viewportFraction: 1);

    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
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
                selectedContact: contactProvider.selectedContact,
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
                selectedContact: contactProvider.selectedContact,
                ofacCode: contactProvider.selectedContact!.ofacCode!,
                motherMaiden: contactProvider.selectedContact!.mothersMaiden!,
                foreignAdress: contactProvider.selectedContact!.foreignAddress!,
                foreignCity: contactProvider.selectedContact!.foreignCity!,
                foreignProvince:
                    contactProvider.selectedContact!.foreignProvince!,
                emergencyName: contactProvider.selectedContact!.emergencyPhone!,
                foreignZipCode: contactProvider.selectedContact!.foreignZip!,
                space: 40,
              )),
            ),
            SingleChildScrollView(
              child: BodyCustom(
                  body: CardBody4(
                selectedContact: contactProvider.selectedContact,
                emergencyPhone:
                    contactProvider.selectedContact!.emergencyPhone!,
                cubanFirstName:
                    contactProvider.selectedContact!.cubanFirstName!,
                cubanLastName: contactProvider.selectedContact!.cubanLastName!,
                arrivalDocs: contactProvider.selectedContact!.arrivalDoc!,
                countryIssue: contactProvider.selectedContact!.countryOfIssue!,
                arrivalDocNo: contactProvider.selectedContact!.arrivalDocNo!,
                space: 40,
              )),
            ),
            SingleChildScrollView(
              child: Stack(
                children: [
                  BodyCustom(
                      body: CardBody5(
                    selectedContact: contactProvider.selectedContact,
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
                  Positioned(
                    left: size.width * 0.25,
                    bottom: size.height * 0.02,
                    child: MaterialButton(
                      onPressed: () async {
                        loadingSpinner(context);
                        try {
                          contactProvider
                              .updateContact(
                                  contact: contactProvider.selectedContact!,
                                  token: loginProvider.loggedUser!.jwt)
                              .whenComplete(() {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        } catch (e) {
                          // mostrar error cuando veamos como los vamos a poner

                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02)),
                      height: size.height * 0.07,
                      minWidth: size.width * 0.5,
                      color: kprimarycolor,
                      child: const Text(
                        'Editar Contacto',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            left: size.width * 0.35,
            bottom: size.height * 0.92,
            child: SmoothPageIndicator(
              controller: controller,
              count: 5,
              effect: ExpandingDotsEffect(
                  dotHeight: 16, dotWidth: 16, activeDotColor: kprimarycolor
                  //  type: WormType.thin,
                  // strokeWidth: 5,
                  ),
            )),
      ]),
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
          height: size.height,
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
