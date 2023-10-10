import 'package:ebayapp/screens/login_screen.dart';
import 'package:ebayapp/screens/web_screen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return const WebScreen();
        } else {
          return const LogIn();
        }
      },
    );
  }
}
