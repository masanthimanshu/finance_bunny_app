import 'package:finance_bunny/components/radial_chart.dart';
import 'package:finance_bunny/components/transaction_card.dart';
import 'package:finance_bunny/controller/home_controller.dart';
import 'package:finance_bunny/data/color_data.dart';
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
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const SizedBox(height: 250, child: RadialChart()),
            GridView.builder(
              shrinkWrap: true,
              itemCount: colorData.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 20,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (e, index) {
                return Row(children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: colorData[chartData[index].type],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    chartData[index].type,
                    style: CustomTextStyle.boldSubHeading.style,
                  ),
                ]);
              },
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Recent Transactions",
            style: CustomTextStyle.mediumHeading.style,
          ),
        ),
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
