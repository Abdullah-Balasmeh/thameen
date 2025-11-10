import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'OnBoardingView',
              style: AppTextStyle.semiBold13.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const Center(
            child: Text('OnBoardingView', style: AppTextStyle.semiBold13),
          ),
        ],
      ),
    );
  }
}
