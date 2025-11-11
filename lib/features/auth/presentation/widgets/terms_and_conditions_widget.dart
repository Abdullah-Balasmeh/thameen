import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/auth/presentation/widgets/custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'by creating an account you agree to our ',
                  style: AppTextStyle.semiBold14.copyWith(
                    color: AppColors.black,
                  ),
                ),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: AppTextStyle.semiBold14.copyWith(
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
          ),
        ),
      ],
    );
  }
}
