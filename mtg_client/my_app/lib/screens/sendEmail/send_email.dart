import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/shared/bottom_nav_bar.dart';
import 'package:http/http.dart' as http;

class SendEmailScreen extends StatelessWidget {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();
  SendEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Email'),
        backgroundColor: Color(0xff009E60),
        toolbarHeight: 45,
        elevation: 5,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(title: 'Name', controller: controllerName),
            const SizedBox(height: 10),
            buildTextField(title: 'Email', controller: controllerEmail),
            const SizedBox(height: 10),
            buildTextField(title: 'Subject', controller: controllerSubject),
            const SizedBox(height: 10),
            buildTextField(
              title: 'Message',
              controller: controllerMessage,
              maxLines: 8,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff053739),
                minimumSize: Size.fromHeight(50),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text('SEND'),
              onPressed: () => sendEmail(
                  name: controllerName.text,
                  email: controllerEmail.text,
                  subject: controllerSubject.text,
                  message: controllerMessage.text),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

Widget buildTextField({
  required String title,
  required TextEditingController controller,
  int maxLines = 1,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        )
      ],
    );

Future sendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async {
  final serviceId = 'service_r88ncqa';
  final templateId = 'template_dqufdxt';
  final userId = 'xz2TC2e2hUnAT0IBY';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {
        'origin': 'http//localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          }
        },
      ));

  print(response.body);
  Get.back();
}
