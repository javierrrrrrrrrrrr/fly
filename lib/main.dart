import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fly_cliente/Business_logic/Provaiders/book_flight_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/login_provider.dart';
import 'package:fly_cliente/Business_logic/Provaiders/contact_provider.dart';
import 'package:fly_cliente/UI/Pages/airline_info.dart';
import 'package:fly_cliente/UI/Pages/more_details_fly.dart';
import 'package:fly_cliente/UI/Pages/add_personal_information.dart';
import 'package:fly_cliente/UI/Pages/contact_show_info.page.dart';
import 'package:fly_cliente/UI/Pages/search_page.dart';
import 'package:fly_cliente/UI/Pages/search_result.dart';
import 'package:fly_cliente/UI/Pages/more_details_ofert.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:provider/provider.dart';

import 'Business_logic/Provaiders/flight_provider.dart';
import 'Business_logic/Provaiders/flip_provider.dart';
import 'Business_logic/Provaiders/news_provider.dart';
import 'UI/Pages/contact/contacts_page.dart';
import 'UI/Pages/home_page.dart';
import 'UI/Pages/login_page.dart';
import 'UI/Pages/login_register_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => FlipProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => FlightProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => BookFlightProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => NewsProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => ContactProvider(),
        lazy: true,
      ),
      // ChangeNotifierProvider(
      //   create: (_) => SearchProvider(),
      //   lazy: false,
      // ),
    ],
    child: const MyApp(),
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);
    return InAppNotification(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(fontFamily: 'LexendDeca'),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/airlines': (context) => const AirlineInfoPage(),
          '/search': (context) => const SearchPage(),
          '/vermas': (context) => const MoreDetailsOfert(),
          '/result': (context) => const SearchResult(),
          '/MoreDetailsFly': (context) => MoreDetailsFly(
                departureflight: flightProvaider.selectedDepartureFlight!,
              ),
          '/create_contat_page': (context) => const CreateContactPage(),
          '/contacts_show_info': (context) => const ContactInformation(),
          '/contacts': (context) => const ContactsPage(),
          '/login': (context) => const LoginPage(),
          '/loginRegister': (context) => const LoginRegisterPage(),
        },
      ),
    );
  }
}
