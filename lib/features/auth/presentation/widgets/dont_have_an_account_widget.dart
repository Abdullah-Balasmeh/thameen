import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/auth/presentation/views/signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: r"Don't have an account?",
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.gray,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            text: 'Create One',
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
