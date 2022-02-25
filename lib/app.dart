import 'package:flash_chat_flutter/providers/firebase_provider.dart';
import 'package:flash_chat_flutter/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseProvider(),
        ),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlashChat",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      routes: AppRoutes.getAppRoutes,
      theme: AppTheme.lightTheme,
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}
