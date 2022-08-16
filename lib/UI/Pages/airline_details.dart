import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';

import '../Widgets/widgets.dart';

class AirlinePage extends StatelessWidget {
  const AirlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: size.height * 0.05, left: size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const Text(
                    'Miranda Charter',
                    style: TextStyle(fontSize: 21),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const CustomRowDrawer(
                  icono: Icons.house, texto: "House", tamnofuente: 18),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.airplane_ticket_outlined,
                  texto: "Reservations",
                  tamnofuente: 18),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.connecting_airports_outlined,
                  texto: "Airlaine",
                  tamnofuente: 18),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.login_sharp, texto: "Log in", tamnofuente: 18),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.feed_outlined,
                  texto: "General Information",
                  tamnofuente: 18),
              const Separador(),
              SizedBox(
                height: size.height * 0.41,
              ),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.security_outlined,
                  texto: "Privacy Policy",
                  tamnofuente: 17),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.contact_support_outlined,
                  texto: "Contact Miranda Charter",
                  tamnofuente: 17),
            ],
          ),
        ),
      ),
    );
  }
}
