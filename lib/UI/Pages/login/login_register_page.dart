import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import '../../../Constants/contants.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/login_provider.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/fondoNubes.jpg"),
                  fit: BoxFit.fill,
                ))),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.035),
              child: Container(
                height: size.height * 0.2,
                width: size.width,
                decoration: const BoxDecoration(
                    // color: Colors.red,

                    image: DecorationImage(
                        image: AssetImage("assets/imagensuperior.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.14,
                width: size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/basearreglada.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              bottom: size.height * 0.67,
              left: size.width * 0.35,
              child: Container(
                height: size.height * 0.18,
                width: size.width * 0.35,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/sinfondo.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              bottom: size.height * 0.55,
              left: size.width * 0.1,
              child: const CustomLoginImput(
                hintext: "Name",
                iconodata: Icons.person_outline,
              ),
            ),
            Positioned(
              bottom: size.height * 0.45,
              left: size.width * 0.1,
              child: CustomLoginImput(
                onChanged: (value) {
                  loginProvider.email = value;
                },
                hintext: "Email",
                iconodata: Icons.contact_mail_outlined,
              ),
            ),
            Positioned(
              bottom: size.height * 0.35,
              left: size.width * 0.1,
              child: CustomLoginImput(
                onChanged: (value) {
                  loginProvider.password = value;
                },
                hintext: "Password",
                iconodata: Icons.lock_outline,
              ),
            ),
            Positioned(
              bottom: size.height * 0.18,
              left: size.width * 0.1,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                height: size.height * 0.07,
                minWidth: size.width * 0.8,
                color: kprimarycolor,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  loadingSpinner(context);
                  bool respuesta = await loginProvider.createNomralUser();

                  if (respuesta == true) {
                    bool respuesta2 = await loginProvider.loginNormalUser();
                    if (respuesta2 == true) {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/airlines');
                      print('correcto');
                    }
                    if (respuesta == false || respuesta2 == false) {
                      Navigator.pop(context);
                      var snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Error!',
                          message: loginProvider.error,
                          contentType: ContentType.failure,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                child: const Center(
                    child: Text(
                  "Sigin up",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            ),
            Container(
                //google icon with color
                child: Positioned(
              bottom: size.height * 0.07,
              left: size.width * 0.7,
              child: SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.2,
                //   decoration: const BoxDecoration(
                //       image: DecorationImage(
                //           // image: AssetImage("assets/googleicon.png"),
                //           // fit: BoxFit.fill)),
                // ),
              ),
            )),
            Positioned(
              bottom: size.height * 0.04,
              left: size.width * 0.17,
              child: Container(
                height: size.height * 0.05,
                width: size.width * 0.65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.1,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/google.png"),
                              fit: BoxFit.fill)),
                    ),
                    Text("Sign in Google",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomLoginImput extends StatelessWidget {
  const CustomLoginImput({
    Key? key,
    required this.hintext,
    required this.iconodata,
    this.onChanged,
  }) : super(key: key);

  final String hintext;
  final IconData iconodata;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: size.height * 0.06),
          filled: true,
          fillColor: Colors.white,
          hintText: hintext,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            iconodata,
            color: kprimarycolor,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
