import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:thameen/features/auth/presentation/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        true,
        title: 'Create Account',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const SafeArea(
        child: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
