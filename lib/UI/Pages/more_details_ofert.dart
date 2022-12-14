import '../../Constants/contants.dart';
import '../Widgets/app_background_selection.dart';
import '../Widgets/widgets.dart';

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
      body: Container(
        color: kprimarycolor,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: AppBackgroundSelection(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              customAppBar: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.025,
                ),
                child: Container(
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
                      const CustomCircleAvatar()
                    ],
                  ),
                ),
              ),
              body: Expanded(
                  child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height * 0.02),
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    left: size.width * 0.08,
                    right: size.width * 0.08,
                  ),
                  child: Column(
                    children: [
                      Text(
                        title ?? '',
                        style: TextStyle(
                            color: kprimarycolor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: 2,
                        width: size.width * 0.8,
                        color: const Color.fromRGBO(155, 155, 155, 0.5),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.63,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                            description ?? '',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(95, 95, 95, 1)),
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
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
