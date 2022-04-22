import 'package:flutter/material.dart';
import 'package:my_app/screens/cart/components/cartTickets.dart';
import 'package:my_app/screens/cart/components/cartTotal.dart';
import 'package:my_app/screens/shared/bottom_nav_bar.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xff009E60),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartTickets(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}
