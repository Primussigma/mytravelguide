import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import '../controllers/home_controller.dart';
//import 'second_screen.dart';
//import 'ticket_page.dart';
import "../dropdownmenu.dart";
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  //final HomeController controller = Get.put(HomeController());
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final List<String> imageList = [
    "https://www.telegraph.co.uk/content/dam/Travel/Destinations/Caribbean/StVincentGrenadadines/kingstown-st-vincent-port-guide-2.jpg",
    'https://img.marinas.com/v2/c23db371789f065ab2935dbf2a57d9779ed6a6ced13d178125be215fbcea6947.jpg',
    'https://cdn.pixabay.com/photo/2019/11/25/18/24/st-4652732_960_720.jpg',
  ];

  HomeScreen({Key? key, required String this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DropDownMenu(),
      /* drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              tileColor: Colors.blueAccent,
              title: const Text('Home'),
              onTap: () {
                Get.back();
                }
            ),
            ListTile(
              title: const Text('Page2'),
              onTap: () {
                Get.back();
                Get.to(SecondScreen(title: 'Page2'));
                }
            ),
            ListTile(
              title: const Text('Buy a Ticket'),
              onTap: () {
                Get.back();
                Get.to(TicketPage(title: 'MyTravelGuide'));
                }
            )
          ],
        ),
      ), */
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageList[i],
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      var url = imageList[i];
                      print(url.toString());
                    },
                  );
                },
              ),
            ),

            /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               /*  ElevatedButton(
                  onPressed: controller.increment,
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: const Text('Decrement'),
                ), */
                ElevatedButton(
                  onPressed: () => Get.to(SecondScreen(title: 'MyTravelGuide')),
                  child: const Text('Page2'),
                ),
                ElevatedButton(
                  onPressed: () => Get.to(TicketPage(title: 'TicketPage')), 
                  child: const Text('Tickets ')
                ) */
          ],
        ),
      ),
    );
  }
}
