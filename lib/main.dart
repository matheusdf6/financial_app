import 'package:financial_app/presentation/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xFFFFFFFFF),
        accentColorBrightness: Brightness.light,
        primaryColor: Color(0xFF5DB075),
        primaryColorBrightness: Brightness.light,
        primaryColorDark: Color(0xFF4B9460),
        primaryColorLight: Color(0xFFF0F5F1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(),
    );
  }
}
