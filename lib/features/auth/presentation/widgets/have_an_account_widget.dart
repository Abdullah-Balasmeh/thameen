import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.black,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: 'Sign In',
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
              shadows: [
                const Shadow(
                  color: Colors.black,
                  offset: Offset(0.5, .5),
                ),
              ],
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
