import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:provider/provider.dart';

import 'Business_logic/Provaiders/book_flight_provider.dart';
import 'Business_logic/Provaiders/contact_provider.dart';
import 'Business_logic/Provaiders/flight_provider.dart';
import 'Business_logic/Provaiders/flip_provider.dart';
import 'Business_logic/Provaiders/forms_providers/contact_form_provider.dart';
import 'Business_logic/Provaiders/forms_providers/status_provider.dart';
import 'Business_logic/Provaiders/login_provider.dart';
import 'Business_logic/Provaiders/news_provider.dart';
import 'Business_logic/Provaiders/payment_provider.dart';
import 'UI/Pages/airline_info.dart';
import 'UI/Pages/check_pay.dart';
import 'UI/Pages/check_reservation_status.dart';
import 'UI/Pages/contact/contact_show_info.page.dart';
import 'UI/Pages/contact/contacts_page.dart';
import 'UI/Pages/contact/create_contact_page.dart';
import 'UI/Pages/home_page.dart';
import 'UI/Pages/login/login_page.dart';
import 'UI/Pages/login/login_register_page.dart';
import 'UI/Pages/more_details_fly.dart';
import 'UI/Pages/more_details_ofert.dart';
import 'UI/Pages/search_page.dart';
import 'UI/Pages/search_result.dart';
import 'UI/Pages/splashScreen.dart';
import 'UI/Widgets/fligthDetailWidgets/drop_down_check_list.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => FlightProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => ContactProvider(),
        lazy: false,
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
        create: (_) => FlipProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => ContactFormProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => PaymentsProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => StatusProvider(),
        lazy: true,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightProvaider = Provider.of<FlightProvider>(context);
    return InAppNotification(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Havana Charter',
        theme: ThemeData(
          fontFamily: 'LexendDeca',
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
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
          '/l': (context) => const DropDownListExample(),
          '/check_pay': (context) => const CheckPay(),
          '/check_reservation_status': (context) =>
              const CheckReservationStatus(),
        },
        //tema con color personalizado
      ),
    );
  }
}
