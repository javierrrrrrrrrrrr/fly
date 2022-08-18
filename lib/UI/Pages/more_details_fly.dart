import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/widgets.dart';

class MoreDetailsFly extends StatelessWidget {
  const MoreDetailsFly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              child: Image.asset("assets/fondo.jpg", fit: BoxFit.fill)),
          Positioned(
            top: size.height * 0.1,
            right: size.width * 0.1,
            child: const CustomCircleAvatar(avatarRadius: 30),
          ),
          Positioned(
              top: size.height * 0.11,
              left: size.width * 0.1,
              child: Icon(
                Icons.arrow_back_ios,
                size: 40,
                color: kprimarycolor,
              )),
          Positioned(
            top: size.height * 0.25,
            left: size.width * 0.05,
            child: Container(
              color: Colors.white,
              height: size.height * 0.4,
              width: size.width * 0.9,
            ),
          )
        ],
      ),
    );
  }
}
