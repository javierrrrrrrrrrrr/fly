import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/app_background_selection.dart';
import 'package:fly_cliente/UI/Widgets/widgets.dart';

class MoreDetailsOfert extends StatelessWidget {
  const MoreDetailsOfert(
      {Key? key, this.title, this.description, this.buttonText})
      : super(key: key);

  final String? title;
  final String? description;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: AppBackgroundSelection(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
          ),
          customAppBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.height * 0.025,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.navigate_before,
                    size: 40,
                    color: kprimarycolor,
                  ),
                ),
                const CustomCircleAvatar(
                  avatarRadius: 28,
                )
              ],
            ),
          ),
          body: Expanded(
              child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: size.height * 0.05),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    title ?? '',
                    style: TextStyle(
                        color: kprimarycolor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 2,
                  width: size.width * 0.8,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    left: size.width * 0.08,
                    right: size.width * 0.08,
                  ),
                  //TODO: Despues ver como se comporta el texto dentro del campo de abajo.
                  child: SizedBox(
                    height: size.height * 0.63,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        description ?? '',
                        style: const TextStyle(
                            fontSize: 20, color: Color.fromRGBO(95, 95, 95, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(buttonText ?? '',
                      style: TextStyle(
                          fontSize: 14,
                          color: kprimarycolor,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
