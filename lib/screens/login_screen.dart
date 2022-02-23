import 'package:flash_chat_flutter/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/assets.dart';
import '../providers/providers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        authProvider.cleanData();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
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
                controller: authProvider.emailTextController,
                onChanged: (value) {
                  authProvider.email = value;
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: authProvider.passwordTextController,
                onChanged: (value) {
                  authProvider.password = value;
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  final user = await authProvider.signIn();
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.routeName);
                    authProvider.emailTextController.clear();
                    authProvider.passwordTextController.clear();
                    authProvider.cleanData();
                  }
                },
                child: const Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
