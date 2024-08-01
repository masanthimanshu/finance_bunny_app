import 'package:finance_bunny/components/radial_chart.dart';
import 'package:finance_bunny/components/side_drawer.dart';
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
                    color: colorData[index].colors,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    colorData[index].name,
                    style: CustomTextStyle.boldSubHeading.style,
                  ),
                ]);
              },
            ),
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
