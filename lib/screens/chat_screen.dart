import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/firebase_provider.dart';
import '../theme/theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const routeName = 'Chat';

  @override
  Widget build(BuildContext context) {
    final firebaseProvider =
        Provider.of<FirebaseProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        firebaseProvider.signOut();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                firebaseProvider.signOut();
                Navigator.pop(context);
              },
            ),
          ],
          title: const Text('⚡️Chat'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _MessagesStream(
                firebaseProvider: firebaseProvider,
              ),
            ),
            Container(
              decoration: AppTheme.messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: firebaseProvider.chatController,
                      onChanged: (value) {
                        firebaseProvider.messageText = value;
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
                      firebaseProvider.chatController.clear();
                      firebaseProvider.addData();
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

class _MessagesStream extends StatelessWidget {
  const _MessagesStream({
    Key? key,
    required this.firebaseProvider,
  }) : super(key: key);

  final FirebaseProvider firebaseProvider;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: firebaseProvider.messagesStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        final documents = snapshot.data!.docs.reversed.toList();
        return ListView.builder(
          reverse: true,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];
            final email = document['sender'];
            final message = document['text'];
            return MessageBubble(
              email: email,
              message: message,
            );
          },
        );
      },
    );
  }
}
