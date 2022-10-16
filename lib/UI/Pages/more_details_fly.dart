import 'package:flip_card/flip_card.dart';
import '../../Business_logic/Provaiders/flip_provider.dart';
import '../../Constants/contants.dart';
import '../../DataLayer/Models/flight_model.dart';
import '../Widgets/app_background_selection.dart';
import '../Widgets/fligthDetailWidgets/big_card_departure.dart';
import '../Widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/flight_provider.dart';
import '../Widgets/fligthDetailWidgets/big_card_return.dart';
import '../Widgets/fligthDetailWidgets/custom_bottom_in_card.dart';

class MoreDetailsFly extends StatelessWidget {
  const MoreDetailsFly({
    Key? key,
    required this.departureflight,
  }) : super(key: key);

  final Flight departureflight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final flightProvaider = Provider.of<FlightProvider>(context);
    final flipProvider = Provider.of<FlipProvider>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(
        color: kprimarycolor,
        child: SafeArea(
            child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: AppBackgroundSelection(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
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
                    const CustomCircleAvatar()
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    top: size.height * 0.05,
                    right: size.width * 0.05,
                  ),
                  child: Column(
                    children: [
                      /**Carta grande Departure*/
                      FlipCard(
                        controller: flipProvider.controllerBigCard,
                        flipOnTouch: false,
                        back: flightProvaider.returnflights.isNotEmpty
                            ? BigCardReturn(
                                //TODO: Revisar despues si Hay algun error aqui.... con el null safety de abajo..
                                selectedReturnFlight:
                                    flightProvaider.selectedReturnFlight,
                              )
                            : Container(),
                        front: BigCardDeparture(
                          departureflight: departureflight,
                          flightProvaider: flightProvaider,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      CustomButtomCard(
                        departureFlight: departureflight,
                        flightProvaider: flightProvaider,
                      )
                    ],
                  ),
                ),
              ),
              //
            ),
          ),
        )),
      ),
    );
  }
}
