import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:thameen/features/auth/presentation/widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = 'login_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, false, title: 'Sign In'),
      body: const SafeArea(
        child: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
