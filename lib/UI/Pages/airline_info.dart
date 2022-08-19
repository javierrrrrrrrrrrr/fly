import 'package:fly_cliente/UI/Pages/more_details_ofert.dart';

import '../Widgets/app_background_selection.dart';
import '../Widgets/custom_appbar_row.dart';
import '../Widgets/widgets.dart';

class AirlineInfoPage extends StatelessWidget {
  const AirlineInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: AppBackgroundSelection(
          padding: EdgeInsets.only(
            left: size.width * 0.06,
            top: size.height * 0.05,
            right: size.width * 0.06,
          ),
          customAppBar: const AppBarRow(),
          body: BodyAirlineDetails(size: size),
        ),
      ),
    );
  }
}

class BodyAirlineDetails extends StatelessWidget {
  const BodyAirlineDetails({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.07,
            ),
            //TODO: Ver q aqui van las cartas estas por listViews desde el api..

            InformationCard(
              verMasOnpressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: ((context) => const MoreDetailsOfert(
                          buttonText:
                              'Especial Miercoles 3 de Agosto Mia SCr \$419',
                          description:
                              "**Importante, por favor recordarle a los pasajeros llenar 24h antes de su vuelo, el formulario de viaje en la pagina de XD",
                          title: 'Super Oferta',
                        ))),
              ),
              buttonText: 'Especial Miercoles 3 de Agosto Mia SCr \$419',
              description:
                  "**Importante, por favor recordarle a los pasajeros llenar 24h antes de su vuelo, el formulario de viaje en la pagina de XD",
              title: 'Super Oferta',
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InformationCard(
              verMasOnpressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MoreDetailsOfert(
                  buttonText: 'Especial Miercoles 3 de Agosto Mia SCr \$419',
                  description:
                      "Precio de \n Miami y Tampa\n Actualizado el 5 de julio \n\n Miami-Habana \$379 vuelo diario\n (Viernes 3147 \$349) (Doming...",
                  title: 'Informacion General',
                ),
              )),
              buttonText: 'Especial Miercoles 3 de Agosto Mia SCr \$419',
              description:
                  "Precio de \n Miami y Tampa\n Actualizado el 5 de julio \n\n Miami-Habana \$379 vuelo diario\n (Viernes 3147 \$349) (Doming...",
              title: 'Informacion General',
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InformationCard(
              verMasOnpressed: () {},
              buttonText: 'Especial Miercoles 3 de Agosto Mia SCr \$419',
              description:
                  "**Importante, por favor recordarle a los pasajeros llenar 24h antes de su vuelo, el formulario de viaje en la pagina de XD",
              title: 'Super Oferta',
            ),
          ],
        ),
      ),
    );
  }
}
