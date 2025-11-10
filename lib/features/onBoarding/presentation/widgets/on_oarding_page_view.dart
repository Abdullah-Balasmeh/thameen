import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/features/onBoarding/presentation/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesNboarding1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to ',
                style: AppTextStyle.bold24,
              ),
              Text(
                'Thameen',
                style: AppTextStyle.bold24.copyWith(
                  color: const Color(0xff0D61AD),
                ),
              ),
            ],
          ),
          subtitle:
              'asdsadasdsadsdasdasdasd sadsaadasdasdasasdasdsa asdsadasdsaadasdasdasdasd',
        ),
        PageViewItem(
          isVisible: true,
          image: Assets.imagesOnboring4,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'find ',
                style: AppTextStyle.bold24,
              ),
              Text(
                'Thameen',
                style: AppTextStyle.bold24.copyWith(
                  color: const Color(0xff0D61AD),
                ),
              ),
            ],
          ),
          subtitle: 'sgfsdg sadsaadasdasdasasdasdsa asdsadasdsaadasdasdasdasd',
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.imagesNboarding3,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'AI to ',
                style: AppTextStyle.bold24,
              ),
              Text(
                'Thameen',
                style: AppTextStyle.bold24.copyWith(
                  color: const Color(0xff0D61AD),
                ),
              ),
            ],
          ),
          subtitle:
              'asdsadasdsadsdasdasdasd sadsaadasdasdasasdasdsa asdsadasdsaadasdasdasdasd',
        ),
      ],
    );
  }
}
