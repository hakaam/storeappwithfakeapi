import 'package:ecommerceappwithapiiiiiiis/ui/account.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/cart.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/explore.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/home.dart';
import 'package:ecommerceappwithapiiiiiiis/ui/offer.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
   int currentIndex=0;
   List listOfScreens=[
     Home(),
     Explore(),
     Cart(),
     Offer(),
     Account()


   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:

          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

              currentIndex: currentIndex,
              onTap: (index) {
              setState(() {
                currentIndex=index;


              });


              },
              items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_rounded), label: 'Offer'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
      ]),
      body: listOfScreens[currentIndex],
    );
  }
}
