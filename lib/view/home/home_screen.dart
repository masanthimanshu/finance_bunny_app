import 'package:finance_bunny/components/side_drawer.dart';
import 'package:finance_bunny/view/chat/chat_screen.dart';
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ChatScreen()),
        ),
      ),
    );
  }
}
