import 'package:flutter/material.dart';
import 'package:fly_cliente/UI/Pages/airline_details.dart';

import 'UI/Pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      },
    );
  }
}
