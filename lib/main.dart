import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0E1020),
        scaffoldBackgroundColor: Color(0xFF0E1020),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/final': (context) => FinalPage(),
      },
    );
  }
}
