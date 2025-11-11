import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thameen/core/constants/constant.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/shared/widgets/custom_button.dart';

class OtpVerificationViewBody extends StatelessWidget {
  const OtpVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: SvgPicture.asset(
              Assets.imagesOtpVerification,
              fit: BoxFit.contain,
            ),
          ),
          const Text('Verify Your Phone Number', style: AppTextStyle.bold24),
          const SizedBox(height: 16),
          const Text(
            'Enter the 6 digit code sent to your number',
            style: AppTextStyle.semiBold16,
          ),

          Text(
            '+962 780299043',
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
          const SizedBox(height: 24),
          PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 50,
              activeColor: AppColors.primary,
              inactiveColor: AppColors.gray,
              activeFillColor: Colors.white,
              selectedFillColor: Colors.white,
              inactiveFillColor: Colors.white,
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            enableActiveFill: true,
            // errorAnimationController: errorController,
            // controller: textEditingController,
            onCompleted: (v) {
              print('Completed');
            },
            onChanged: (value) {
              // print(value);
              // setState(() {
              //   currentText = value;
              // });
            },
            beforeTextPaste: (text) {
              print('Allowing to paste $text');
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
          const SizedBox(height: 8),
          CustomButton(text: 'Verify', onPressed: () {}),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Didn\'t receive the code? ',
                style: AppTextStyle.semiBold16,
              ),
              Text(
                'Resend',
                style: AppTextStyle.semiBold16.copyWith(
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
        ],
      ),
    );
  }
}
