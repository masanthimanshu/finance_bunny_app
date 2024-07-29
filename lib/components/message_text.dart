import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  const MessageText({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width / 1.5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.teal[200],
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(15),
            ),
          ),
          child: Text(msg),
        ),
      ],
    );
  }
}
