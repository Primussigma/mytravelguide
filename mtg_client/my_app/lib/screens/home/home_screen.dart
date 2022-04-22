import 'package:flutter/material.dart';
import 'package:my_app/screens/home/components/body.dart';
import 'package:my_app/screens/shared/bottom_nav_bar.dart';
import 'package:my_app/screens/shared/dropdownmenu.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DropDownMenu(),
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xff009E60),
        toolbarHeight: 45,
        elevation: 5,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        padding: EdgeInsets.only(top: 20,bottom: 20),
        child: Body()
      ),
    );
  }
}
