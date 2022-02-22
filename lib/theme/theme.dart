import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.lightBlueAccent;
  static const Color secondary = Colors.blueAccent;

  static const sendButtonTextStyle = TextStyle(
    color: primary,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const messageTextFieldDecoration = InputDecoration(
      hintText: 'Type your message here...',
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none);

  static const messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: primary, width: 2.0),
    ),
  );

  static const text45w900Black54 = TextStyle(
    fontSize: 45.0,
    color: Colors.black54,
    fontWeight: FontWeight.w900,
  );

  static OutlineInputBorder outlineInputBorder({
    required Color color,
    required double borderSideWith,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: borderSideWith,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(32.0),
      ),
    );
  }

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        primary: Colors.lightBlueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: const Size(200, 42),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
    ),
    // textTheme: lightTextTheme,
  );

  // static const TextTheme lightTextTheme = TextTheme(
  //   bodyText1: TextStyle(color: Colors.black54),
  // );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    // textTheme: darkTextTheme,
  );

  // static const TextTheme darkTextTheme = TextTheme();
}
