import 'package:flutter/material.dart';

import 'splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Populer Persons App',
      home: SplashScreen(),
    );
  }
}

// class sport

class Ds {
  final String name;
  final String details;
  final String moredetails;
  final String image;
  final String gamelink;

  Ds(this.name, this.details, this.moredetails, this.image, this.gamelink);
}

// class player
class Person {
  final String name;
  final String info;
  final String image1;
  final String website;
  String? image2;

  Person(this.name, this.info, this.image1, this.website, {this.image2});
}
