import 'package:flutter/material.dart';
import 'package:thameen/features/splash/presentation/views/splash_view.dart';

class Thameen extends StatelessWidget {
  const Thameen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff0D61AD),
      ),
      home: const SplashView(),
    );
  }
}
