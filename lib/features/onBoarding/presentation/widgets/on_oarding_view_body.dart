import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:thameen/core/constants/constant.dart';
import 'package:thameen/features/onBoarding/presentation/widgets/on_oarding_page_view.dart';
import 'package:thameen/shared/widgets/custom_button.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: OnBoardingPageView(
              pageController: pageController,
            ),
          ),
          DotsIndicator(
            dotsCount: 3,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              activeColor: const Color(0xff0D61AD),
              color: const Color(0xff0D61AD).withValues(alpha: 0.5),
            ),
            animate: true,
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: currentPage == 2,
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: CustomButton(
                onPressed: () {},
                text: 'Get Started',
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
