import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/personal_info_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../SeparationWidget/separador.dart';
import '../imput_field.dart';

class CradBody3 extends StatelessWidget {
  const CradBody3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    final personalInfoProvider = Provider.of<PersonalInfoProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Flight Information",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          CustomDropDown(
            iconData: Icons.description_outlined,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de ofac codes here...
            items: const [
              'Code 1',
              'Code 2',
              'Code 3',
            ],
            hintext: 'Ofac Code',
            onChanged: (value) =>
                personalInfoProvider.ofacCode = value.toString(),
            onSaved: (value) =>
                personalInfoProvider.ofacCode = value.toString(),
          ),
          // Imputfield(
          //   avalible: flipProvaider.avalible,
          //   hintext: "Ofac Code",
          //   suffixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
          //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
          //   prefixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.description_outlined, color: Colors.blue)
          //       : const Icon(Icons.description_outlined, color: Colors.grey),
          // ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.motherMaiden = value,
            avalible: flipProvaider.avalible,
            hintext: "Mothers Maiden",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.description_outlined, color: Colors.blue)
                : const Icon(Icons.description_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.foreingAddress = value,
            avalible: flipProvaider.avalible,
            hintext: "Foreign Address",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.house_outlined, color: Colors.blue)
                : const Icon(Icons.house_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.foreingCity = value,
            avalible: flipProvaider.avalible,
            hintext: "Foreign City",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.location_city, color: Colors.blue)
                : const Icon(Icons.location_city, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.foreingProvince = value,
            avalible: flipProvaider.avalible,
            hintext: "Foreign Province",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.location_city, color: Colors.blue)
                : const Icon(Icons.location_city, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.foreingZip = value,
            avalible: flipProvaider.avalible,
            hintext: "Foreign Zip",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.pin_outlined, color: Colors.blue)
                : const Icon(Icons.pin_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.emergencyNumber = value,
            avalible: flipProvaider.avalible,
            hintext: "Emergency Number",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.phone_android, color: Colors.blue)
                : const Icon(Icons.phone_android, color: Colors.grey),
          ),
          Container(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
