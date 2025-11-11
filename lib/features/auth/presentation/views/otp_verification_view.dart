import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/views/signup_view.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:thameen/features/auth/presentation/widgets/otp_verification_view_body.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});
  static const String routeName = 'otp_verification_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        true,
        title: 'OTP Verification',
        onPressed: () {
          Navigator.pushReplacementNamed(context, SignupView.routeName);
        },
      ),
      body: const SafeArea(
        child: OtpVerificationViewBody(),
      ),
    );
  }
}
