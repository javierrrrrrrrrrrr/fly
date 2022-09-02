import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Pages/airline_info.dart';
import 'package:fly_cliente/UI/Pages/more_details_fly.dart';
import 'package:fly_cliente/UI/Pages/search_page.dart';
import 'package:fly_cliente/UI/Pages/search_result.dart';
import 'package:fly_cliente/UI/Pages/more_details_ofert.dart';
import 'package:provider/provider.dart';

import 'Business_logic/Provaiders/flight_provider.dart';
import 'Business_logic/Provaiders/news_provider.dart';
import 'UI/Pages/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => FlightProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => NewsProvider(),
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
    return MaterialApp(
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
        '/MoreDetailsFly': (context) => const MoreDetailsFly(),
      },
    );
  }
}
