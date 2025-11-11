import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });
  final String text;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.textFieldFillColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1,
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: icon,
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
