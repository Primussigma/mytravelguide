import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/login/loginScreen.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
           color: Color(0xff009E60),
        ),
        Container(
          width: context.screenWidth,
          height: context.percentHeight * 80,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              )),
        ),
        Center(
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            Image.asset(
              'assets/images/Boating App Logo-01.png',
              height: 150,
              width: 300,
            ).py(20),
            const TextField(
              autofocus: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email',
                  hintText: 'ex: john@gmail.com',
                  prefixIcon: Icon(Icons.email)),
            ).p(10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  backgroundColor: Color(0xff053739),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70))),
              onPressed: () => Get.to(() => LoginScreen()),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
