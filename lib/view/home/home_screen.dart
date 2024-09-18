import 'package:finance_bunny/components/side_drawer.dart';
import 'package:finance_bunny/components/transaction_card.dart';
import 'package:finance_bunny/controller/home_controller.dart';
import 'package:finance_bunny/style/text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(backgroundColor: Colors.white, child: SideDrawer()),
      appBar: AppBar(title: const Text("Finance Bunny")),
      body: FutureBuilder(
        future: HomeController().recentTransactions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No transactions yet",
                  style: CustomTextStyle.mediumHeading.style,
                ),
                const SizedBox(height: 100, width: double.infinity),
                Image.asset("assets/images/arrow.png", width: 200),
              ],
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (e, index) {
              return TransactionCard(data: snapshot.data![index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () => Navigator.pushNamed(context, "/chat"),
      ),
    );
  }
}
