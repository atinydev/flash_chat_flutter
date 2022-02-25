import 'dart:ui';

import 'package:flutter/material.dart';

class NotificationsService {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    final text = message.substring(message.indexOf(']') + 1).trim();
    final snackBar = SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
    messengerKey.currentState?.showSnackBar(snackBar);
  }
}
