import 'package:flutter/material.dart';
import 'package:thameen/core/constants/constant.dart';
import 'package:thameen/features/auth/presentation/views/signin_view.dart';
import 'package:thameen/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:thameen/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0D61AD),
      body: SafeArea(child: SplashViewBody()),
    );
  }

  void executeNavigation() {
    final bool isSeen = SharedPreferencesSingleton.getBool(isOnboardingSeen);
    final bool isRememberMe = SharedPreferencesSingleton.getBool(
      kisRememberMe,
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (!isSeen) {
        // لم يرَ المستخدم شاشة المقدمة
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      } else if (isSeen) {
        // رأى المقدمة وفعّل "تذكرني"
        Navigator.pushReplacementNamed(context, SigninView.routeName);
      } else {
        // رأى المقدمة لكن لم يفعّل "تذكرني"
      }
    });
  }
}
