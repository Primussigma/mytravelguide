import 'package:flutter/material.dart';
import 'package:my_app/screens/shared/bottom_nav_bar.dart';
import 'package:my_app/screens/shared/dropdownmenu.dart';
import 'package:my_app/screens/ticket/component/triplist.dart';

class Ticket extends StatelessWidget {
  Ticket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: DropDownMenu(),
        backgroundColor: Color(0xffEBEBEB),
        appBar: AppBar(
          title: Text('Ticket'),
          backgroundColor: Color(0xff009E60),
          bottom: TabBar(tabs: [
            Tab(text: "Kingstown"),
            Tab(text: "Mayreau"),
            Tab(text: "Canouan"),
            Tab(text: "Union Island"),
          ]),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: TabBarView(children: [
          TripList(source: "Kingstown"),
          TripList(source: "Mayreau"),
          TripList(source: "Canouan"),
          TripList(source: "Union Island"),
        ]),
      ),
    );
  }
}
