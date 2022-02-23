import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/services/notifications_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  var email = '';
  var password = '';
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool showSpinner = false;

  final auth = FirebaseAuth.instance;

  Future<UserCredential?> createUser() async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint('$e');
      NotificationsService.showSnackBar(e.toString());
      return null;
    }
  }

  Future<UserCredential?> signIn() async {
    try {
      return await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint('$e');
      NotificationsService.showSnackBar(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  void wait() {
    showSpinner = true;
    notifyListeners();
  }

  void resume() {
    showSpinner = false;
    notifyListeners();
  }

  void cleanData() {
    if (emailTextController.text != '') {
      emailTextController.clear();
    }
    if (passwordTextController.text != '') {
      passwordTextController.clear();
    }
    email = '';
    password = '';
  }
}
