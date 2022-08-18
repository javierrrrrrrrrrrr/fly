import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Pages/airline_details.dart';
import 'package:fly_cliente/UI/Pages/more_details_fly.dart';
import 'package:fly_cliente/UI/Pages/search_page.dart';
import 'package:fly_cliente/UI/Pages/search_result.dart';
import 'package:fly_cliente/UI/Pages/more_details_ofert.dart';

import 'UI/Pages/home_page.dart';

void main() => runApp(const MyApp());

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
        '/airlines': (context) => const AirlinePage(),
        '/search': (context) => const SearchPage(),
        '/vermas': (context) => const VerMasPage(
              buttonText: '',
              description: '',
              title: '',
            ),
        '/result': (context) => const SearchResult(),
        '/MoreDetailsFly': (context) => const MoreDetailsFly(),
      },
    );
  }
}
