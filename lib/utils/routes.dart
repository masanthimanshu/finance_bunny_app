import 'package:flutter/material.dart';

import '/view/auth/phone_screen.dart';
import '/view/chat/chat_screen.dart';
import '/view/home/home_screen.dart';
import 'custom_root.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (e) => const CustomRoot(),
  "/home": (e) => const HomeScreen(),
  "/chat": (e) => const ChatScreen(),
  "/auth": (e) => const PhoneScreen(),
};
