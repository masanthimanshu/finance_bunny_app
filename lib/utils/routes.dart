import 'package:flutter/material.dart';

import '/view/auth/phone_screen.dart';
import '/view/chat/chat_screen.dart';
import '/view/drawer_screens/privacy_policy.dart';
import '/view/drawer_screens/terms_conditions.dart';
import '/view/home/home_screen.dart';
import 'custom_root.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (e) => const CustomRoot(),
  "/home": (e) => const HomeScreen(),
  "/chat": (e) => const ChatScreen(),
  "/auth": (e) => const PhoneScreen(),
  "/terms": (e) => const TermsConditions(),
  "/privacy": (e) => const PrivacyPolicy(),
};
