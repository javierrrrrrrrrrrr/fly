import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flip_provider.dart';
import 'card_body1.dart';
import 'card_body3.dart';
import 'card_body4.dart';
import 'card_body5.dart';
import 'crad_body2.dart';

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
                firstname: "Nombre",
                lastname: "Apellido",
                passengerType: "Tipo de Pasajero",
                birthDate: "Fecha de Nacimiento",
                email: "Email",
                gender: "Género",
                phone: "Teléfono",
              )
            : flipProvaider.flip == 1
                ? const CardBody2(
                    spacenamed: false,
                    address: "Dirección",
                    city: "Cuidad",
                    state: "Estado",
                    zipCode: "Código Postal",
                    country: "Paíz",
                    nationality: "Nacionalidad")
                : flipProvaider.flip == 2
                    ? const CardBody3(
                        spacenamed: false,
                        ofacCode: "Ofac Código",
                        motherMaiden: "Nombre de Soltera",
                        foreignAdress: "Dirección Extranjera",
                        foreignCity: "Cuidad Extranjaera",
                        foreignProvince: "Provincia Extranjera",
                        foreignZipCode: "Código Postal Extrangero",
                        emergencyName: "Número de Emergencia",
                      )
                    : flipProvaider.flip == 3
                        ? const CardBody4(
                            spacenamed: false,
                            emergencyPhone: "Teléfono de Emergencia",
                            cubanFirstName: "Primer Nombre Cubano",
                            cubanLastName: "Apellido Cubano",
                            arrivalDocs: "Documentos de Llgada",
                            countryIssue: "País En Cuentión",
                            arrivalDocNo: "Documentos de Llgada No",
                          )
                        : const CardBody5(
                            spacenamed: false,
                            expDate: "Fecha de Vencimiento",
                            passportNumbersec: "Número de Pasaporte",
                            contryOfIssuesec: "País en Cuestion",
                            arrivalDocNumbersec: "Documentos de Llgada No",
                            expDatesec: "Fecha de Vencimiento",
                          ));
  }
}
