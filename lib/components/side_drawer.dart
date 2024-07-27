import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DrawerHeader(child: Image.asset("assets/images/logo.png")),
      const ListTile(
        title: Text("Get Help"),
        leading: Icon(Icons.help_outline, color: Colors.teal),
      ),
      const Divider(),
      const ListTile(
        title: Text("Rate Us"),
        leading: Icon(Icons.star_border, color: Colors.teal),
      ),
      const Divider(),
      const ListTile(
        title: Text("About Us"),
        leading: Icon(Icons.person_outline, color: Colors.teal),
      ),
      const Divider(),
      const ListTile(
        title: Text("Terms & Conditions"),
        leading: Icon(Icons.privacy_tip_outlined, color: Colors.teal),
      ),
      const Divider(),
      const ListTile(
        title: Text("Privacy Policy"),
        leading: Icon(Icons.contact_page_outlined, color: Colors.teal),
      ),
      const Divider(),
      ListTile(
        title: const Text("Logout"),
        onTap: () => FirebaseAuth.instance.signOut(),
        leading: const Icon(Icons.logout, color: Colors.teal),
      ),
      const Divider(),
    ]);
  }
}
