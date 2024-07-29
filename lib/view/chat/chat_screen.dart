import 'package:finance_bunny/components/chat_field.dart';
import 'package:finance_bunny/components/message_text.dart';
import 'package:finance_bunny/controller/chat_controller.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        StreamBuilder(
          stream: ChatController().getChats(),
          builder: (context, snapshot) => Expanded(
            child: snapshot.hasData && snapshot.data!.isNotEmpty
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (e, index) => MessageText(
                      msg: snapshot.data![index].userPrompt.toUpperCase(),
                    ),
                  )
                : const Center(child: Text("No Chats Yet")),
          ),
        ),
        const ChatField(),
      ]),
    );
  }
}
