import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/userController.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/login/loginScreen.dart';
import 'package:my_app/services/database.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.offAll(() => HomeScreen());
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      print(_authResult.user!.uid);
      UserModel usr = await Database().getUser(_authResult.user!.uid);
      Get.find<UserController>().user = usr;
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
