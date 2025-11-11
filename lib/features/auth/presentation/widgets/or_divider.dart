import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 18,
            color: AppColors.dividerColor,
            thickness: 1,
          ),
        ),
        Text(
          'OR',
          style: AppTextStyle.bold14.copyWith(
            color: AppColors.black,
          ),
        ),
        const Expanded(
          child: Divider(
            indent: 18,
            color: AppColors.dividerColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
