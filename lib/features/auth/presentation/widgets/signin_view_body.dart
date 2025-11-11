// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thameen/core/constants/constant.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:thameen/features/auth/presentation/widgets/dont_have_an_account_widget.dart';
import 'package:thameen/features/auth/presentation/widgets/or_divider.dart';
import 'package:thameen/features/auth/presentation/widgets/remember_me_and_forget_password.dart';
import 'package:thameen/features/auth/presentation/widgets/social_auth_button.dart';
import 'package:thameen/shared/widgets/custom_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              AuthTextFormField(
                textInputAction: TextInputAction.next,
                controller: _emailController,
                hintText: 'Email Address',
                obscureText: false,
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Address is required';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Email address is not valid';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              AuthTextFormField(
                textInputAction: TextInputAction.next,
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock_outline),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              RememberMeAndForgetPassword(
                onChanged: (value) {
                  isRememberMe = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   context.read<SigninCubit>().signInWithEmailAndPassword(
                  //     _emailController.text,
                  //     _passwordController.text,
                  //     isRememberMe,
                  //   );
                  // } else {
                  //   setState(() {
                  //     _autovalidateMode = AutovalidateMode.always;
                  //   });
                  // }
                },
              ),
              const SizedBox(height: 30),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 30),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialAuthButton(
                text: 'Sign In With Google',
                onPressed: () {
                  // context.read<SigninCubit>().signInWithGoogle();
                },
                icon: SvgPicture.asset(Assets.imagesGoogleIcon),
              ),
              const SizedBox(height: 16),
              SocialAuthButton(
                text: 'Sign In With Facebook',
                onPressed: () {
                  // context.read<SigninCubit>().signInWithFacebook();
                },
                icon: SvgPicture.asset(Assets.imagesFacebookIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
