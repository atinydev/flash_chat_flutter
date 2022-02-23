import 'package:flutter/material.dart';

class NotificationsService {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    messengerKey.currentState?.showSnackBar(snackBar);
  }
}
