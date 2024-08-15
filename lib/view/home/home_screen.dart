import 'package:finance_bunny/components/transaction_card.dart';
import 'package:finance_bunny/controller/home_controller.dart';
import 'package:finance_bunny/style/text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Text("Recent Transactions", style: CustomTextStyle.mediumHeading.style),
        FutureBuilder(
            future: HomeController().recentTransactions(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("No Transactions yet");
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (e, index) => TransactionCard(
                  data: snapshot.data![index],
                ),
              );
            }),
        const SizedBox(height: 50),
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () => Navigator.pushNamed(context, "/chat"),
      ),
    );
  }
}
