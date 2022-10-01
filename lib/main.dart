import 'package:flutter/material.dart';
import 'package:khetihar/pages/buyer/login.dart';
import 'package:khetihar/pages/buyer/signup.dart';
import 'package:khetihar/pages/farmer/homepage.dart';
import 'package:khetihar/pages/farmer/login.dart';
import 'package:khetihar/pages/landing_page.dart';
import 'package:khetihar/utils/routes.dart';

import 'pages/farmer/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Khetihar",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => LandingPage(),
        "/flogin": (context) => FarmerLogin(),
        "/fsignup": (context) => FarmerSignUp(),
        "/fhome": (context) => FarmerHomePage(),
        "/blogin": (context) => BuyerLogin(),
        "/bsignup": (context) => BuyerSignUp(),
      },
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
