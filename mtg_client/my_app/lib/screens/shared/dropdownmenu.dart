import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/cartController.dart';
import 'package:my_app/controllers/userController.dart';
import 'package:my_app/screens/cart/cartScreen.dart';
import 'package:my_app/screens/contactInfo/contacts.dart';
import 'package:my_app/screens/login/loginScreen.dart';
import 'package:my_app/screens/sendEmail/send_email.dart';

class DropDownMenu extends StatelessWidget {
  final UserController userController = Get.find();
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: userController.user.name != null
                ? Text(userController.user.name!)
                : Text('Guest'),
            accountEmail: userController.user.email != null
                ? Text(userController.user.email!)
                : Text('Not Logged In'),
            decoration: BoxDecoration(
              color: Colors.green[700],
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () {
              Get.to(() => (Cart()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text('Ferry Information'),
            onTap: () {
              Get.to(() => (ContactsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.mail_rounded),
            title: Text('Send Email'),
            onTap: () {
              Get.to(() => (SendEmailScreen()));
            },
          ),
          Visibility(
            visible: userController.user.name == null,
            child: ListTile(
              title: Text('Sign In'),
              leading: Icon(Icons.exit_to_app_rounded),
              onTap: () {
                Get.to(() => (LoginScreen()));
              },
            ),
            replacement: ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app_rounded),
              onTap: () {
                Get.offAll(() => (LoginScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
