import 'package:flip_card/flip_card.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/app_background_selection.dart';
import 'package:fly_cliente/UI/Widgets/fligthDetailWidgets/big_card_departure.dart';
import 'package:fly_cliente/UI/Widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../Business_logic/Provaiders/flight_provider.dart';
import '../Widgets/fligthDetailWidgets/big_card_return.dart';
import '../Widgets/fligthDetailWidgets/custom_bottom_in_card.dart';

class MoreDetailsFly extends StatelessWidget {
  const MoreDetailsFly({Key? key, this.index}) : super(key: key);

  final int? index;

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)?.settings.arguments as int;
    final size = MediaQuery.of(context).size;
    final flightProvaider = Provider.of<FlightProvider>(context);
    final flipProvider = Provider.of<FlipProvider>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
          child: AppBackgroundSelection(
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
        body: Padding(
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
                        index: flightProvaider.indexselectedFlightReturn)
                    : Container(),
                front: BigCardDeparture(
                  flightProvaider: flightProvaider,
                  index: index,
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              CustomButtomCard(
                flightProvaider: flightProvaider,
                index: index,
              )
            ],
          ),
        ),
        padding: EdgeInsets.only(
          top: size.height * 0.05,
        ),
      )),
    );
  }
}
