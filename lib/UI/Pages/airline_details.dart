import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Pages/home_page.dart';
import 'package:fly_cliente/UI/Widgets/custom_circle_avatar.dart';
import 'package:google_fonts/google_fonts.dart';

class AirlinePage extends StatelessWidget {
  const AirlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/fondo.jpg',
            ),
            fit: BoxFit.fill,
          )),
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.08,
              top: size.height * 0.05,
              right: size.width * 0.08,
            ),
            child: Column(
              children: [
                // Primera Row de la Vista esto es para guirnos despues en el disenno

                Row(
                  children: [
                    const CustomCircleAvatar(),
                    const Spacer(),
                    Icon(
                      Icons.mark_email_unread_outlined,
                      color: kprimarycolor,
                      size: 50,
                    ),
                    SizedBox(width: size.width * 0.02),
                    Icon(
                      Icons.notifications_active_outlined,
                      color: kprimarycolor,
                      size: 50,
                    )
                  ],
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        const InformationCard(
                          buttonText:
                              'Especial Miercoles 3 de Agosto Mia SCr \$419',
                          description:
                              "**Importante, por favor recordarle a los pasajeros llenar 24h antes de su vuelo, el formulario de viaje en la pagina de XD",
                          title: 'Super Oferta',
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const InformationCard(
                          buttonText:
                              'Especial Miercoles 3 de Agosto Mia SCr \$419',
                          description:
                              "Precio de \n Miami y Tampa\n Actualizado el 5 de julio \n\n Miami-Habana \$379 vuelo diario\n (Viernes 3147 \$349) (Doming...",
                          title: 'Informacion General',
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const InformationCard(
                          buttonText:
                              'Especial Miercoles 3 de Agosto Mia SCr \$419',
                          description:
                              "**Importante, por favor recordarle a los pasajeros llenar 24h antes de su vuelo, el formulario de viaje en la pagina de XD",
                          title: 'Super Oferta',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
  }) : super(key: key);

  final String title;
  final String description;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomCard(
          child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.toUpperCase(),
                style: GoogleFonts.lexendDeca(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kprimarycolor,
                  textStyle: Theme.of(context).textTheme.displayMedium,
                )),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.003,
                vertical: size.height * 0.025,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(70, 70, 70, 0.2),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.015,
                    horizontal: size.width * 0.03),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Text(buttonText,
                style: TextStyle(
                    fontSize: 14,
                    color: kprimarycolor,
                    fontWeight: FontWeight.bold))
          ],
        ),
      )),
    );
  }
}
