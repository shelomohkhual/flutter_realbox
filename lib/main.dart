// PACKAGES
import 'package:flutter/material.dart';
// PAGES
import './pages/homepage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable 'Debug Icon'
      debugShowCheckedModeBanner: false,
      // App Theme
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.yellow,
      ),
      // App Name
      title: 'REALBOX',
      // HomePage Widget
      home: HomePage(),
    );
  }
}