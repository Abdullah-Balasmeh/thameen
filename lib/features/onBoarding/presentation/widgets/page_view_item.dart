import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.isVisible,
  });
  final String image, subtitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: isVisible,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Skip',
                    style: AppTextStyle.medium18.copyWith(
                      color: const Color(0xff0D61AD),
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xff0D61AD),
                      shadows: [
                        const Shadow(
                          color: Colors.black,
                          offset: Offset(0.5, .5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: SvgPicture.asset(image),
        ),
        const SizedBox(height: 24),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.medium18,
          ),
        ),
      ],
    );
  }
}
