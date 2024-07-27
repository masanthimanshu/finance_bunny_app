import 'package:finance_bunny/style/text_style.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
    required this.field,
    required this.heading,
    required this.nextBtn,
    required this.subHeading,
  });

  final Widget field;
  final String heading;
  final String subHeading;
  final VoidCallback nextBtn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset(
          "assets/images/login_bg.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading, style: CustomTextStyle.heading.style),
                  const SizedBox(height: 5),
                  Text(subHeading, style: CustomTextStyle.subHeading.style),
                  const SizedBox(height: 50),
                  field,
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: nextBtn,
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
