import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff0D61AD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.bold24.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
