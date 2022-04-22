import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/aboutUs/aboutUs.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/ticket/ticket_page.dart';

import 'package:my_app/screens/tracking/livetracking.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff009E60),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -7),
              blurRadius: 33,
              color: Color(0xFF6DAED9).withOpacity(0.11)),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_rounded),
              color: Colors.white,
              onPressed: () {
                Get.to(() => (HomeScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.map_rounded),
              color: Colors.white,
              onPressed: () {
                Get.to(() => (GoogleMapScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.schedule_rounded),
              color: Colors.white,
              onPressed: () {
                Get.to(() => (Ticket()));
              },
            ),
            IconButton(
              icon: Icon(Icons.supervised_user_circle),
              color: Colors.white,
              onPressed: () {
                Get.to(() => (AboutUsPage()));
              },
            ),
          ]),
    );
  }
}
