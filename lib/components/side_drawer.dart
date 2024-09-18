import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Image.asset("assets/images/logo.png"),
      const Divider(),
      ListTile(
        title: const Text("Terms & Conditions"),
        onTap: () => Navigator.pushNamed(context, "/terms"),
        leading: const Icon(Icons.privacy_tip_outlined, color: Colors.teal),
      ),
      const Divider(),
      ListTile(
        title: const Text("Privacy Policy"),
        onTap: () => Navigator.pushNamed(context, "/privacy"),
        leading: const Icon(Icons.contact_page_outlined, color: Colors.teal),
      ),
      const Divider(),
      const ListTile(
        title: Text("Logout"),
        leading: Icon(Icons.logout, color: Colors.teal),
      ),
      const Divider(),
    ]);
  }
}
