import 'package:finance_bunny/data/color_data.dart';
import 'package:finance_bunny/model/chat_model.dart';
import 'package:finance_bunny/style/text_style.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.data});

  final ChatModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorData[data.category]!),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-5, 5),
            color: colorData[data.category]!,
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(data.userPrompt, style: CustomTextStyle.graySubHeading.style),
        const SizedBox(height: 25),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("23 July 2024", style: CustomTextStyle.subHeading.style),
          Text("₹ ${data.amount}", style: CustomTextStyle.boldSubHeading.style),
        ]),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: colorData[data.category]!.withOpacity(0.15),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: colorData[data.category]!, width: 2),
          ),
          child: Row(children: [
            Icon(
              Icons.money,
              color: colorData[data.category]!.withOpacity(0.5),
            ),
            const SizedBox(width: 10),
            Text(data.category, style: CustomTextStyle.boldSubHeading.style),
            const Spacer(),
            Text(data.subCategory, style: CustomTextStyle.graySubHeading.style),
          ]),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
        ]),
      ]),
    );
  }
}
