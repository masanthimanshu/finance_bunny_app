import 'package:finance_bunny/data/color_data.dart';
import 'package:finance_bunny/model/chat_model.dart';
import 'package:finance_bunny/style/text_style.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.data});

  final ChatModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(children: [
        Icon(Icons.monetization_on_outlined, color: colorData[data.category]),
        const SizedBox(width: 15),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(data.category, style: CustomTextStyle.boldSubHeading.style),
          Text(data.subCategory, style: CustomTextStyle.graySubHeading.style),
        ]),
        const Spacer(),
        Text("₹ ${data.amount}", style: CustomTextStyle.graySubHeading.style),
      ]),
    );
  }
}
