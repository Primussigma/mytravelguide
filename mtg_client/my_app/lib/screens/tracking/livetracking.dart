import 'package:my_app/screens/shared/bottom_nav_bar.dart';
import 'package:my_app/screens/shared/dropdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/tracking/component/body.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: DropDownMenu(),
      appBar: AppBar(
        title: Text('Live Tracking'),
        backgroundColor: Color(0xff009E60),
        toolbarHeight: 45,
        elevation: 5,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: TrackingBody(),
    );
  }
}
