import 'package:finance_bunny/components/home_chart.dart';
import 'package:finance_bunny/components/side_drawer.dart';
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
      drawer: const Drawer(child: SideDrawer()),
      body: Column(children: [
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note)),
            const SizedBox(height: 250, child: HomeChart()),
            Row(children: [
              Container(color: Colors.red, width: 25, height: 25),
              const Text("Income"),
              Container(color: Colors.red, width: 25, height: 25),
              const Text("Expense"),
            ]),
            Row(children: [
              Container(color: Colors.red, width: 25, height: 25),
              const Text("Savings"),
              Container(color: Colors.red, width: 25, height: 25),
              const Text("Investment"),
            ]),
          ]),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () => Navigator.pushNamed(context, "/chat"),
      ),
    );
  }
}
