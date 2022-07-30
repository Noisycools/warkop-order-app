import 'package:flutter/material.dart';
import 'package:warkop_order_app/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warkop Order App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: HexColor("#faead2"),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: HexColor("#cf8743")),
      ),
      home: const HomeScreen(selectedTab: 0, menuIndex: 0, categoryIndex: -1),
    );
  }
}
