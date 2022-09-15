import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:fly_cliente/UI/Widgets/CustomWidget/custom_drawer2.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:provider/provider.dart';

import '../widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flipProvaider = Provider.of<FlipProvider>(context);
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: size.height * 0.03, left: size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Scaffold.of(context).closeDrawer(),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/fondo.png'),
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
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
              CustomRowDrawer(
                  onPressed: () => Navigator.of(context).pushNamed('/home'),
                  icono: Icons.house_outlined,
                  texto: "Home",
                  tamnofuente: 18),
              const Separador(),
              CustomRowDrawer(
                  onPressed: () => Navigator.of(context).pushNamed('/search'),
                  icono: Icons.airplane_ticket_outlined,
                  texto: "Reservations",
                  tamnofuente: 18),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.connecting_airports_outlined,
                  texto: "Airlaine",
                  tamnofuente: 18),
              const Separador(),
              CustomRowDrawer(
                  onPressed: () {
                    flipProvaider.flip = 0;
                    Navigator.of(context).pushNamed('/PersonalInfoHome');
                  },
                  icono: Icons.perm_identity_sharp,
                  texto: "Personal information",
                  tamnofuente: 18),
              const Separador(),
              const CustomRowDrawer(
                  icono: Icons.contacts_outlined,
                  texto: "Contacts",
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
