import 'package:flutter/material.dart';
import 'package:my_app/screens/shared/dropdownmenu.dart';
import 'package:my_app/screens/home/components/boatlist.dart';
import 'package:my_app/screens/home/components/carousel.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DropDownMenu(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: ImageCarousel(),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: BoatList(),
            )
          ],
        ),
      ),
    );
  }
}
