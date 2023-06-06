import 'package:ecommerceappwithapiiiiiiis/bottombar/bottombar.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/home.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/login.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/register_form.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/splash.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'Login': (context) => Login(),
        'regis': (context) => RegisterForm(),
        'home': (context) => Home(),
        'bottomBar': (context) => CustomBottomBar(),
        'splash': (context) => Splash(),



      },
      home: Login(),
    );
  }
}
