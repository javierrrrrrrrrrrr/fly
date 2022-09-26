import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/contact_provider.dart';
import 'package:fly_cliente/UI/Widgets/CustomWidget/custom_dropdown.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:fly_cliente/UI/Widgets/imput_field.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import '../../../Constants/validacion.dart';
import '../../../DataLayer/Models/contact_model.dart';
import 'custom_piked_date.dart';

class CardBody1 extends StatelessWidget {
  const CardBody1({
    Key? key,
    this.space,
    required this.firstname,
    required this.lastname,
    required this.passengerType,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phone,
    this.spacenamed, this.selectedContact,
  }) : super(key: key);

  //bool para controlar el espacio entre los campos
  final bool? spacenamed;

  //
  final double? space;
  final String firstname;
  final String lastname;
  final String passengerType;
  final String birthDate;
  final String gender;
  final String email;
  final String phone;

  final Contact? selectedContact;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final contactProvider = Provider.of<ContactProvider>(context);
    final contactFormProvider = Provider.of<ContactFormProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Form(
        key: contactFormProvider.formkey1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: const Text(
                "Personal Information",
                style: TextStyle(fontSize: 25),
              ),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "First Name",
                  ),
            Imputfield(
              initialValue: selectedContact == null ? '' : selectedContact!.firstName,
                keyboardType: TextInputType.name,
                onChanged: (value) =>
                    contactProvider.selectedContact!.firstName = value,
                hintext: selectedContact == null ? firstname : selectedContact!.firstName,
                
                 

                prefixIcon:
                    const Icon(Icons.badge_outlined, color: Colors.blue)),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Last Name",
                  ),
            Imputfield(
              initialValue: selectedContact == null ? '' : selectedContact!.lastName,
              hintext: selectedContact == null ? lastname : selectedContact!.lastName,
              keyboardType: TextInputType.name,
              onChanged: (value) =>
                  contactProvider.selectedContact!.lastName = value,
              prefixIcon: const Icon(Icons.badge_outlined, color: Colors.blue),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Passenger Type",
                  ),
            CustomDropDown(

              
              iconData: Icons.family_restroom,
              contentPadding: EdgeInsets.only(left: size.width * 0.095),
              items: const [
                'Adult',
                'Child',
                'Infant',
              ],
              hintext: passengerType,
              onChanged: (value) => contactProvider
                  .selectedContact!.passengerType = value.toString(),
              onSaved: (value) => contactProvider
                  .selectedContact!.passengerType = value.toString(),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Birth Date",
                  ),
                  
            CustomPikedDate(
              hintText: selectedContact == null ? birthDate : selectedContact!.birthDate!,
              onSelectedDate: (piked) {
                contactProvider.selectedContact!.birthDate =
                    "${piked.year}/${piked.month <= 9 ? 0.toString() + piked.month.toString() : piked.month}/${piked.day <= 9 ? 0.toString() + piked.day.toString() : piked.day}";
               
              },
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Gender",
                  ),
            CustomDropDown(
              
              iconData: Icons.man,
              contentPadding: EdgeInsets.only(left: size.width * 0.095),
              items: const [
                'Male',
                'Female',
                'Other',
              ],
              hintext: gender,
              onChanged: (value) =>
                  contactProvider.selectedContact!.gender = value.toString(),
              onSaved: (value) =>
                  contactProvider.selectedContact!.gender = value.toString(),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Email",
                  ),
            Imputfield(
              initialValue: selectedContact == null ? '' : selectedContact!.email,
              hintext: selectedContact == null ? email : selectedContact!.email!,
              keyboardType: TextInputType.emailAddress,
              validator: mail,
              onChanged: (value) =>
                  contactProvider.selectedContact!.email = value.toString(),
              prefixIcon:
                  const Icon(Icons.contact_mail_outlined, color: Colors.blue),
            ),
            spacenamed == false
                ? const Separador()
                : Separador(
                    space: space,
                    texto: "Phone",
                  ),
            Imputfield(
             initialValue: selectedContact == null ? '' : selectedContact!.phone,
              hintext:  selectedContact == null ? phone : selectedContact!.phone!,
              keyboardType: TextInputType.phone,
              onChanged: (value) =>
                  contactProvider.selectedContact!.phone = value,
              prefixIcon: const Icon(Icons.phone_android, color: Colors.blue),
            ),
            Container(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
