import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), navigationBar);
  }

  navigationBar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = await prefs.getString('access_token');
    if (data == null) {
      Navigator.pushReplacementNamed(context, 'regis');
    } else {
      Navigator.pushReplacementNamed(context, 'bottomBar');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff40BFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                'https://www.shutterstock.com/image-illustration/perspective-view-empty-shopping-cart-600w-512400853.jpg',
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
