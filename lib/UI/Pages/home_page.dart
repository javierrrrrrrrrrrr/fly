import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fly_cliente/Business_logic/Provaiders/book_flight_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/news_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImageProvider<Object>? image;
  @override
  void initState() {
    image = const AssetImage(
      'assets/fondo.jpg',
    ); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final bookProvider = Provider.of<BookFlightProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: image!,
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.08,
            top: size.height * 0.05,
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
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                try {
                  bool respuesta2 = await bookProvider.refillFieldBookFlights();
                  await newsProvider.getNewsList();

                  var respuesta = newsProvider.respuesta;

                  if (respuesta == true && respuesta2 == true) {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/airlines');
                  } else {
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
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
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
