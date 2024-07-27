import 'package:finance_bunny/components/chat_field.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        ChatField(),
      ]),
    );
  }
}
