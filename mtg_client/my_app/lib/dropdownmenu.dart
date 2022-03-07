import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/livetracking.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
import 'screens/myfavorites.dart';
import 'screens/purchases.dart';
import 'screens/settings.dart';
import 'screens/ticket_page.dart';
import 'screens/home_screen.dart';

class DropDownMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final user = UserPreferences.myUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Jane Doe'),
            accountEmail: const Text('janedoe_3@email.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green[700],
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.house_rounded),
            title: Text('Home'),
            onTap: () {
              Get.to(() => (HomeScreen(title: "MyTravelGuide")));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on_rounded),
            title: Text('Live Tracker'),
            onTap: () {
              Get.to(() => (GoogleMapScreen()));
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.tickets_fill),
            title: Text('Tickets'),
            onTap: () {
              Get.to(() => (TicketPage(title: "MyTravelGuide")));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Favorites'),
            onTap: () {
              Get.to(() => (FavoritesPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('My Purchases'),
            onTap: () {
              Get.to(() => (PurchasesPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings_rounded),
            title: Text('Settings'),
            onTap: () {
              Get.to(() => (SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text('About Us'),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Sign In'),
            leading: Icon(Icons.exit_to_app_rounded),
            onTap: () {
              Get.to(() => (LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
