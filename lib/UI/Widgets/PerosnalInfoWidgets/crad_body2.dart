import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/flip_provider.dart';
import '../../../Business_logic/Provaiders/personal_info_provider.dart';
import '../CustomWidget/custom_dropdown.dart';
import '../imput_field.dart';

class CradBody2 extends StatelessWidget {
  const CradBody2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flipProvaider = Provider.of<FlipProvider>(context);
    final size = MediaQuery.of(context).size;
    final personalInfoProvider = Provider.of<PersonalInfoProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: const Text(
              "Personal Information",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.address = value,
            avalible: flipProvaider.avalible,
            hintext: "Address",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.house_outlined, color: Colors.blue)
                : const Icon(Icons.house_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.city = value,
            avalible: flipProvaider.avalible,
            hintext: "City",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.location_city, color: Colors.blue)
                : const Icon(Icons.location_city, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.state = value,
            avalible: flipProvaider.avalible,
            hintext: "State",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.real_estate_agent, color: Colors.blue)
                : const Icon(Icons.real_estate_agent, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.zip = value,
            avalible: flipProvaider.avalible,
            hintext: "Zip",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.pin_outlined, color: Colors.blue)
                : const Icon(Icons.pin_outlined, color: Colors.grey),
          ),
          const Separador(),
          Imputfield(
            onChanged: (value) => personalInfoProvider.country = value,
            avalible: flipProvaider.avalible,
            hintext: "Country",
            prefixIcon: flipProvaider.avalible
                ? const Icon(Icons.location_city_sharp, color: Colors.blue)
                : const Icon(Icons.location_city_sharp, color: Colors.grey),
          ),
          const Separador(),
          CustomDropDown(
            iconData: Icons.flag_outlined,
            contentPadding: EdgeInsets.only(left: size.width * 0.095),
            //TODO: Lenar el dropdownn con la lista de nacionalidades...
            items: const [
              'Cuban',
              'Amarican',
              'Others',
            ],
            hintext: 'Nationality',
            onChanged: (value) =>
                personalInfoProvider.nationality = value.toString(),
            onSaved: (value) =>
                personalInfoProvider.nationality = value.toString(),
          ),
          // Imputfield(
          //   avalible: flipProvaider.avalible,
          //   hintext: "Nationality",
          //   prefixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.flag_outlined, color: Colors.blue)
          //       : const Icon(Icons.flag_outlined, color: Colors.grey),
          //   suffixIcon: flipProvaider.avalible
          //       ? const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
          //       : const Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
          // ),
          Container(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
