import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/signup.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          color: Color(0xffFCD116),
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
            SizedBox(height: 30),
            Text(
              'MyTravelGuide',
              style: TextStyle(
                color: Color.fromARGB(255, 17, 25, 133),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            Image.asset(
              'assets/images/new_logo.png',
              height: 100,
            ).py(20),
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email',
                  hintText: 'ex: john@gmail.com',
                  prefixIcon: Icon(Icons.email)),
            ).p(10),
            const TextField(
              autofocus: true,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock)),
            ).p(10),
            'Forget password?'.text.make().objectCenterRight().p(10),
            const Text(
              'Already Have an account?',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ).p(10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  backgroundColor: Color(0xff053739),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70))),
              onPressed: () => Get.to(HomeScreen(
                title: 'My Travel Guide',
              )),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const Text(
              'Dont Have an account?',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const SignUpScreen());
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
