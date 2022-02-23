import 'package:flash_chat_flutter/models/assets.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../theme/theme.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const routeName = 'Registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200.0,
              child: Hero(
                tag: Assets.images.logoPng,
                child: Image(
                  image: Assets.images.logoPng,
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                enabledBorder: AppTheme.outlineInputBorder(
                  color: AppTheme.secondary,
                  borderSideWith: 1,
                ),
                focusedBorder: AppTheme.outlineInputBorder(
                  color: AppTheme.secondary,
                  borderSideWith: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                enabledBorder: AppTheme.outlineInputBorder(
                  color: AppTheme.secondary,
                  borderSideWith: 1,
                ),
                focusedBorder: AppTheme.outlineInputBorder(
                  color: AppTheme.secondary,
                  borderSideWith: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final newUser = await auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pushNamed(context, ChatScreen.routeName);
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Register'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
