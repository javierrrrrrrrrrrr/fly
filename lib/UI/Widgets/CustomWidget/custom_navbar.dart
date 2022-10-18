import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../Business_logic/Provaiders/login_provider.dart';

class CustomNavbar extends StatelessWidget {
  CustomNavbar({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);
    final userProvider = Provider.of<ContactProvider>(context);

    return Container(
      height: size.height * 0.07,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/home');
              index = 0;
            },
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Icon(
                  Icons.home,
                  color: index == 0 ? kprimarycolor : Colors.black,
                ),
                Text("Home",
                    style: TextStyle(
                      color: index == 0 ? kprimarycolor : Colors.black,
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/search');
              index = 1;
            },
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Icon(
                  Icons.library_books,
                  color: index == 1 ? kprimarycolor : Colors.black,
                ),
                Text(
                  "Reservar vuelo",
                  style: TextStyle(
                    color: index == 1 ? kprimarycolor : Colors.black,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              index = 2;

              FocusScope.of(context).unfocus();
              loadingSpinner(context);
              if (loginProvider.islogedUser == false) {
                bool respuestaa = await loginProvider.loginMobileUser();

                if (respuestaa == true) {
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
                }
              } else {
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
              }
            },
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Icon(
                  Icons.contacts_outlined,
                  color: index == 2 ? kprimarycolor : Colors.black,
                ),
                Text(
                  "Contactos",
                  style: TextStyle(
                    color: index == 2 ? kprimarycolor : Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
