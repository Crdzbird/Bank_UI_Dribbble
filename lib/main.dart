import 'package:flutter/material.dart';
import 'package:online_bank_dribbble/src/pages/dashboard_page.dart';
import 'package:online_bank_dribbble/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'dashboard': (context) => DashboardPage(),
      },
    );
  }
}
