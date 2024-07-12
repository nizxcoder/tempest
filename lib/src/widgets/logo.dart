import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        'assets/images/tempest.jpeg',
        height: 100.0,
      ),
    );
  }
}
