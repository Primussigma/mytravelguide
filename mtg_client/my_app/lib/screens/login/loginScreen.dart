import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/authController.dart';
import 'package:my_app/screens/login/reset/reset.dart';
import 'package:my_app/screens/login/signup/signup.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends GetWidget<AuthController> {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

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
            TextField(
              autofocus: false,
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email',
                  hintText: 'ex: john@gmail.com',
                  prefixIcon: Icon(Icons.email)),
            ).p(10),
            TextField(
              autofocus: false,
              controller: pwdController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock)),
            ).p(10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  onPressed: () => Get.to(ForgetPasswordScreen()),
                  child: Text('Forget Password')),
            ).p(10),
            Text(
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
              onPressed: () {
                controller.login(emailController.text, pwdController.text);
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ).p(10),
            const Text(
              'Dont Have an account?',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  onPressed: () => Get.to(SignUpScreen()),
                  child: Text('Sign Up')),
            ),
          ]),
        ),
      ]),
    );
  }
}
