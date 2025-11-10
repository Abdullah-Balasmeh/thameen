import 'package:flutter/material.dart';
import 'package:thameen/features/onBoarding/presentation/widgets/on_oarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5EBE0),
      body: SafeArea(child: OnBoardingViewBody()),
    );
  }
}
