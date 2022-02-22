import 'package:flash_chat_flutter/models/assets.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const routeName = 'Registration';

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
              onChanged: (value) {},
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
              onChanged: (value) {},
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
                onPressed: () {},
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
