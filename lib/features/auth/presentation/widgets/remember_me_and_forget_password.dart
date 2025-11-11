import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/auth/presentation/widgets/custom_check_box.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Forgot Password?',
          style: AppTextStyle.bold14.copyWith(
            color: AppColors.primary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primary,
          ),
        ),
        const Spacer(),
        Text(
          'Remember Me',
          style: AppTextStyle.bold14.copyWith(
            color: AppColors.black,
          ),
        ),
        const SizedBox(width: 16),
        CustomCheckBox(
          onChecked: (value) {
            isRememberMe = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isRememberMe,
        ),
      ],
    );
  }
}
