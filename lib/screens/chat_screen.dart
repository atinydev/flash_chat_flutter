import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../theme/theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const routeName = 'Chat';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        authProvider.signOut();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                authProvider.messagesStream();
                // authProvider.signOut();
                // Navigator.pop(context);
              },
            ),
          ],
          title: const Text('⚡️Chat'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: AppTheme.messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        authProvider.messageText = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      authProvider.addData();
                    },
                    child: const Text(
                      'Send',
                      style: AppTheme.sendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
