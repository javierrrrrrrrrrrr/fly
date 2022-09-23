import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:provider/provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/book_flight_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/news_provider.dart';

import '../../Business_logic/Provaiders/login_provider.dart';
import '../../Constants/contants.dart';
import '../Widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Image? image1;

  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/fondo.jpg");
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    precacheImage(image1!.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final bookProvider = Provider.of<BookFlightProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/fondo.jpg"),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.08,
            top: size.height * 0.02,
            right: size.width * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomCircleAvatar(),
              SizedBox(
                height: size.height * 0.2,
              ),
              HavanaAirWidget(onPressed: () async {
                loadingSpinner(context);
                try {
                  Future<bool> respuesta2 =
                      bookProvider.refillFieldBookFlights();
                  await newsProvider.getNewsList();

                  var respuesta = newsProvider.respuesta;

                  if (respuesta == true && await respuesta2 == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamed('/airlines');
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);

                    var snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Error!',
                        message: "A ocurrido algun error en la API",
                        contentType: ContentType.failure,
                      ),
                    );

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (error) {
                  Navigator.pop(context);
                  var snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Error!',
                      message: error.toString(),
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }),
              SizedBox(
                height: size.height * 0.02,
              ),
              const NoAirline(),
            ],
          ),
        ),
      ),
    ));
  }
}

class NoAirline extends StatelessWidget {
  const NoAirline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        //  await loginProvider.loginMobileUser();
        var snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Upss!',
            message: "Mas aerolineas proximamente",
            contentType: ContentType.warning,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: CustomCard(
        height: size.height * 0.11,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(130, 130, 130, 1),
          ),
          child: const Center(
              child: Text(
            'Más aerolíneas próximamente',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

class HavanaAirWidget extends StatelessWidget {
  const HavanaAirWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: CustomCard(
        height: size.height * 0.11,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Charter Cuba',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Havana Air',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.height,
    required this.child,
  }) : super(key: key);

  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 0),
            blurRadius: 5,
            color: Colors.grey,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
