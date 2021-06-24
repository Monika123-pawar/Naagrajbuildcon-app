import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naagrajbuildcon/login.dart';
import 'package:naagrajbuildcon/register.dart';
import 'package:naagrajbuildcon/residentialProperties.dart';
import 'package:naagrajbuildcon/search.dart';
import 'package:naagrajbuildcon/splash.dart';

import 'contactUs.dart';
import 'locationDropdown.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaagrajBuildcon',
      theme: ThemeData(
        primaryColor: Color(0xFF550A0A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(child: Image.asset("NAAGRAJ_Stationary-08.png")),
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Image.asset(
                "NAAGRAJ_Stationary-08.png",
                fit: BoxFit.contain,
                height: 30,
              ),
              expandedHeight: 30,
              collapsedHeight: 150,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Search();
                },
                childCount: 10, // 1000 list items
              ),
            ),
            // ResidentialProperties(),
          ],
        ),
      ),
    );
  }
}
