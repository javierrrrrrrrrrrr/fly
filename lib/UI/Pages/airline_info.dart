import 'package:fly_cliente/Constants/contants.dart';

import '../../Business_logic/Provaiders/news_provider.dart';
import 'more_details_ofert.dart';
import 'package:provider/provider.dart';

import '../Widgets/app_background_selection.dart';
import '../Widgets/CustomWidget/custom_appbar_row.dart';
import '../Widgets/widgets.dart';

class AirlineInfoPage extends StatelessWidget {
  const AirlineInfoPage({Key? key}) : super(key: key);

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
                left: size.width * 0.06,
                top: size.height * 0.01,
                right: size.width * 0.06,
              ),
              customAppBar: const AppBarRow(),
              body: BodyAirlineDetails(size: size),
            ),
          ),
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
    final userProvider = Provider.of<NewsProvider>(context);
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => Future.delayed(const Duration(seconds: 1)),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: userProvider.news.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: size.height * 0.03, top: size.height * 0.01),
                    child: InformationCard(
                      verMasOnpressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: ((context) => MoreDetailsOfert(
                                  buttonText: 'Miranda Charters',
                                  description:
                                      userProvider.news[index].description,
                                  title: userProvider.news[index].title,
                                ))),
                      ),
                      description: userProvider.news[index].description,
                      title: userProvider.news[index].title,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
