import 'package:flutter/material.dart';
import 'package:my_app/screens/shared/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPage();
}

class _ContactsPage extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        title: Text('Contact a Ferry Service'),
        backgroundColor: Color(0xff009E60),
        toolbarHeight: 45,
        elevation: 5,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        width: double.maxFinite,
        height: 745,
        child: Center(
          child: Card(
            color: Color(0xffEBEBEB),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text('Jaden Sun Fast Ferry'),
                      subtitle: Text(
                        'Website: https://jadensunferry.com '
                        'Telephone: (784) 451-2192 Cell: (784) 493-7114 ',
                        softWrap: true,
                      ),
                      isThreeLine: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Visit Our Website'),
                        onPressed: () {
                          launch('https://jadensunferry.com');
                        },
                      ),
                      TextButton(
                        child: const Text('Contact Us'),
                        onPressed: () {
                          launch('tel://(784) 451-2192');
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('Admiral Ferries Ltd.'),
                    subtitle: Text(
                      'Website: https://www.admiralferries.com '
                      'Telephone: (784) 458-3348',
                      softWrap: true,
                    ),
                    isThreeLine: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Visit Our Website'),
                        onPressed: () {
                          launch('https://www.admiralferries.com');
                        },
                      ),
                      TextButton(
                        child: const Text('Contact Us'),
                        onPressed: () {
                          launch('tel://(784) 458-3348');
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('Bequia Express'),
                    subtitle: Text(
                      'Website: https://www.bequiaexpress.com '
                      'Telephone: (784) 457-3539',
                      softWrap: true,
                    ),
                    isThreeLine: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Visit Our Website'),
                        onPressed: () {
                          launch('https://www.bequiaexpress.com');
                        },
                      ),
                      TextButton(
                        child: const Text('Contact Us'),
                        onPressed: () {
                          launch('tel://(784) 457-3539');
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('MV Gem Star'),
                    subtitle: Text(
                      'Website: https://www.insandoutsofsvg.com/articles/ferry-schedule '
                      'Telephone: (246) 262-5876',
                      softWrap: true,
                    ),
                    isThreeLine: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Visit Our Website'),
                        onPressed: () {
                          launch(
                              ' https://www.insandoutsofsvg.com/articles/ferry-schedule');
                        },
                      ),
                      TextButton(
                        child: const Text('Contact Us'),
                        onPressed: () {
                          launch('tel://(246) 262-5876');
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
