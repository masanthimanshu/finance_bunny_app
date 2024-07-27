import 'package:finance_bunny/firebase/remote_config_service.dart';
import 'package:finance_bunny/view/auth/phone_screen.dart';
import 'package:finance_bunny/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomRoot extends StatefulWidget {
  const CustomRoot({super.key});

  @override
  State<CustomRoot> createState() => _CustomRootState();
}

class _CustomRootState extends State<CustomRoot> with RemoteConfigService {
  @override
  void initState() {
    initializeRemoteConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) return const HomeScreen();
        return const PhoneScreen();
      },
    );
  }
}
