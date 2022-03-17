import 'package:get/get.dart';
import 'package:my_app/controllers/authController.dart';
import 'package:my_app/controllers/userController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}