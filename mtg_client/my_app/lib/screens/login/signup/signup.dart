import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/authController.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends GetWidget<AuthController> {
   SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController fullnameController = TextEditingController();
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'Register New User ',
                style: TextStyle(
                  color: Color.fromARGB(255, 17, 25, 133),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ).p(20),
              TextField(
                controller: emailController,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Email',
                    hintText: 'ex: john@gmail.com',
                    prefixIcon: Icon(Icons.email)),
              ).p(10),
              TextField(
                controller: fullnameController,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter FullName',
                    prefixIcon: Icon(Icons.verified_user)),
              ).p(10),
              TextField(
                controller: pwdController,
                autofocus: false,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock)),
              ).p(10),
              TextField(
                autofocus: false,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock)),
              ).p(10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    backgroundColor: Color(0xff053739),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70))),
              onPressed: () {
                    controller.createUser(fullnameController.text, emailController.text, pwdController.text);
                  },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                )
                ,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
