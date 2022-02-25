import 'package:flash_chat_flutter/models/assets.dart';
import 'package:flash_chat_flutter/providers/providers.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const routeName = 'Registration';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<FirebaseProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        authProvider.cleanData();
        return true;
      },
      child: ModalProgressHUD(
        inAsyncCall: authProvider.showSpinner,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 200.0,
                    child: Hero(
                      tag: Assets.images.logoPng,
                      child: Image(
                        image: Assets.images.logoPng,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: authProvider.emailTextController,
                  onChanged: (value) {
                    authProvider.email = value.trim();
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
                  controller: authProvider.passwordTextController,
                  onChanged: (value) {
                    authProvider.password = value.trim();
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
                      authProvider.wait();
                      final user = await authProvider.createUser();
                      if (user != null) {
                        Navigator.pushReplacementNamed(
                            context, ChatScreen.routeName);
                        authProvider.cleanData();
                      }
                      authProvider.resume();
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
        ),
      ),
    );
  }
}
