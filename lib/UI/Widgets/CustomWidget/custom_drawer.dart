import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fly_cliente/Business_logic/Provaiders/forms_providers/status_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/login_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/CustomWidget/custom_row_drawer.dart';
import 'package:fly_cliente/UI/Widgets/SeparationWidget/separador.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final loginProvider = Provider.of<LoginProvider>(context);
    final userProvider = Provider.of<ContactProvider>(context);
    final statusProvider = Provider.of<StatusProvider>(context);
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: size.height * 0.03, left: size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Scaffold.of(context).closeDrawer(),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/fondo.png'),
                          radius: 20,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Column(
                        children: const [
                          Text(
                            'Miranda Charter',
                            style: TextStyle(fontSize: 21),
                          ),
                        ],
                      )
                    ],
                  ),
                  loginProvider.email == ""
                      ? Padding(
                          padding: EdgeInsets.only(left: size.width * 0.12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 25,
                                ),
                                Text('Sign in', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        )
                      : Text(
                          loginProvider.email,
                          style: const TextStyle(fontSize: 16),
                        ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomRowDrawer(
                  onPressed: () => Navigator.of(context).pushNamed('/airlines'),
                  icono: Icons.house_outlined,
                  texto: "Home",
                  tamnofuente: 18),
              const Separador(),
              CustomRowDrawer(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/search');
                    // Navigator.of(context).pushNamed('/login');
                  },
                  icono: Icons.library_books,
                  texto: "Book Flight",
                  tamnofuente: 18),
              const Separador(),
              CustomRowDrawer(
                  onPressed: () async {
                    loadingSpinner(context);
                    bool respuesta = await statusProvider
                        .getInfoStatus(loginProvider.loggedUser!.jwt);

                    if (respuesta == true) {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushNamed('/check_reservation_status');
                    } else {
                      Navigator.of(context).pop();
                      var snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Error!',
                          message: "Error al obtener datos",
                          contentType: ContentType.failure,
                        ),
                      );

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  icono: Icons.airplane_ticket_outlined,
                  texto: "Reservations",
                  tamnofuente: 18),
              const Separador(),
              CustomRowDrawer(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                    // Navigator.of(context).pushNamed('/login');
                  },
                  icono: Icons.connecting_airports_outlined,
                  texto: "Airline",
                  tamnofuente: 18),
              const Separador(),
              CustomRowDrawer(
                  icono: Icons.contacts_outlined,
                  texto: "Contacts",
                  tamnofuente: 18,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    loadingSpinner(context);
                    bool respuesta = await userProvider
                        .getsContacts(loginProvider.loggedUser!.jwt);

                    if (respuesta == true) {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/contacts');
                    } else {
                      Navigator.pop(context);

                      Scaffold.of(context).closeDrawer();
                      var snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Error!',
                          message: userProvider.error,
                          contentType: ContentType.failure,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }),
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

  updateEmail(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Add your email",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: kprimarycolor),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height * 0.045,
                child: TextField(
                    decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: size.height * 0.003),
                  hintText: 'Email',
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(155, 155, 155, 0.5))),
                )),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(size.width * 0.02),
                child: SizedBox(
                  height: size.height * 0.04,
                  width: size.width * 0.25,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.width * 0.02)),
                    onPressed: () {
                      //TODO: Aqui va el metodo de actualizar el user email.
                    },
                    color: kprimarycolor,
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
