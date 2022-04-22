import 'package:flutter/material.dart';
import 'package:my_app/screens/shared/bottom_nav_bar.dart';
import 'package:my_app/screens/shared/dropdownmenu.dart';
import 'package:my_app/widgets/aboutUsWidget.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DropDownMenu(),
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xff009E60),
        toolbarHeight: 45,
        elevation: 5,
      ),
      body: Container(
          padding: EdgeInsets.only(left: 12, top: 20, right: 12),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      'JCS Software Solutions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Meet the team',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  AboutUsWidget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'About the Application',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  textSection,
                ],
              )),
            ],
          )),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget textSection = const Padding(
    padding: EdgeInsets.all(20),
    child: Text(
      'MyTravelGuide is a mobile application, that will allow users to obtain information about '
      'the estimated arrival times, estimated departure times, and current position of boats being tracked '
      'by the system in an easy to understand tabular format, as well as on a virtual map. ',
      softWrap: true,
      style: TextStyle(fontSize: 20, height: 1.5, letterSpacing: 1.0),
    ),
  );
}