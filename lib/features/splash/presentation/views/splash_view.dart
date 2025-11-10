import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.white,
          ),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
