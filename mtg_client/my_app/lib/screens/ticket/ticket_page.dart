import 'package:flutter/material.dart';
import 'package:my_app/screens/shared/dropdownmenu.dart';
//import '../controllers/home_controller.dart';


class TicketPage extends StatelessWidget {
  final String title;
  //final HomeController controller = Get.put(HomeController());
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  // ignore: type_init_formals
  TicketPage({Key? key, required String this.title}) : super(key: key);

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
              title: const Text('Home'),
              onTap: () {
                Get.back();
                Get.to(HomeScreen(title: 'MyTravelGuide'));
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
              tileColor: Colors.blueAccent,
              title: const Text('Buy a Ticket'),
              onTap: () {
                Get.back();
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
            const Text(
              'Available Tickets:',
              style: TextStyle(color: Colors.blue, fontSize: 20),
              softWrap: true,
            ),
            Expanded(
                child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.blue[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ))
          ],
        ),
      ),
    );
  }
}
