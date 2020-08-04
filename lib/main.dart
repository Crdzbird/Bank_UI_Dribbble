import 'package:flutter/material.dart';
import 'package:online_bank_dribbble/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
      },
    );
  }
}
