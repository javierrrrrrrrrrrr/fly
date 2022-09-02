import 'package:fly_cliente/Constants/contants.dart';

import 'widgets.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.verMasOnpressed,
  }) : super(key: key);

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback verMasOnpressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomCard(
          child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kprimarycolor,
                )),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.003,
                vertical: size.height * 0.025,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(70, 70, 70, 0.2),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.015,
                    horizontal: size.width * 0.03),
                child: description.length > 10
                    ? Stack(
                        children: [
                          Column(
                            children: [
                              Text(
                                description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: verMasOnpressed,
                              child: Text(
                                "Ver más",
                                style: TextStyle(
                                    color: kprimarycolor, fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      )
                    : Text(
                        description,
                        style: const TextStyle(fontSize: 20),
                      ),
              ),
            ),
            Center(
              child: Text(buttonText,
                  style: TextStyle(
                      fontSize: 14,
                      color: kprimarycolor,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      )),
    );
  }
}
