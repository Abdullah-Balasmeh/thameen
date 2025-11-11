import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thameen/core/constants/constant.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_phone_text_form_field.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:thameen/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:thameen/features/auth/presentation/widgets/terms_and_conditions_widget.dart';
import 'package:thameen/shared/services/phone_service.dart';
import 'package:thameen/shared/widgets/custom_button.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _firstNameTouched = false;
  bool _lastNameTouched = false;
  bool _emailTouched = false;
  bool _phoneTouched = false;
  bool _passwordTouched = false;
  bool _confirmPasswordTouched = false;
  bool isTermsAccepted = false;
  static const String kJordanPrefix = '+962 7 ';

  @override
  void initState() {
    super.initState();
    // Ensure initial unremovable prefix is present
    _phoneController.text = kJordanPrefix;
    _phoneController.selection = TextSelection.collapsed(
      offset: _phoneController.text.length,
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String _extractLocalDigits(String full) {
    if (!full.startsWith(kJordanPrefix)) return '';
    return full.substring(kJordanPrefix.length);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              AuthTextFormField(
                textInputAction: TextInputAction.next,
                controller: _firstNameController,
                hintText: 'First Name',
                obscureText: false,
                prefixIcon: const Icon(Icons.person_outline),
                keyboardType: TextInputType.name,
                autovalidateMode: _firstNameTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (_) {
                  if (!_firstNameTouched) {
                    setState(() {
                      _firstNameTouched = true;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First Name is required';
                  }
                  if (value.length < 2) {
                    return 'First Name must be at least 2 characters';
                  }

                  // English letters only:
                  // final isLettersOnly = RegExp(r'^[A-Za-z]+$').hasMatch(value);

                  // If allowing Arabic too, use:
                  final isLettersOnly = RegExp(
                    r'^[A-Za-z\u0600-\u06FF]+$',
                  ).hasMatch(value);

                  if (!isLettersOnly) {
                    return 'Letters only (no numbers or symbols)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AuthTextFormField(
                textInputAction: TextInputAction.next,
                controller: _lastNameController,
                hintText: 'Last Name',
                obscureText: false,
                prefixIcon: const Icon(Icons.person_outline),
                keyboardType: TextInputType.name,
                autovalidateMode: _lastNameTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (_) {
                  if (!_lastNameTouched) {
                    setState(() {
                      _lastNameTouched = true;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First Name is required';
                  }
                  if (value.length < 2) {
                    return 'First Name must be at least 2 characters';
                  }

                  // English letters only:
                  // final isLettersOnly = RegExp(r'^[A-Za-z]+$').hasMatch(value);

                  // If allowing Arabic too, use:
                  final isLettersOnly = RegExp(
                    r'^[A-Za-z\u0600-\u06FF]+$',
                  ).hasMatch(value);

                  if (!isLettersOnly) {
                    return 'Letters only (no numbers or symbols)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AuthPhoneTextFormField(
                textInputAction: TextInputAction.next,
                controller: _phoneController,
                hintText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
                autovalidateMode: _phoneTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (_) {
                  if (!_phoneTouched) {
                    setState(() => _phoneTouched = true);
                  }
                },
                // IMPORTANT: formatter that enforces unremovable +962 7 and 8 digits after
                inputFormatters: <TextInputFormatter>[
                  JordanPhoneFormatter(prefix: kJordanPrefix),
                ],
                // Validate exactly 8 digits after the prefix
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required';
                  }
                  if (!value.startsWith(kJordanPrefix)) {
                    return 'Invalid format';
                  }
                  final local = _extractLocalDigits(value);
                  if (local.length != 8) {
                    return 'Phone number must be 8 digits after +962 7';
                  }
                  if (!RegExp(r'^\d{8}$').hasMatch(local)) {
                    return 'Only digits allowed after +962 7';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AuthTextFormField(
                textInputAction: TextInputAction.next,
                controller: _emailController,
                hintText: 'Email Address',
                obscureText: false,
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: _emailTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (_) {
                  if (!_emailTouched) {
                    setState(() {
                      _emailTouched = true;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mail Address is required';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Mail address is not valid';
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
                autovalidateMode: _passwordTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (_) {
                  if (!_passwordTouched) {
                    setState(() {
                      _passwordTouched = true;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }

                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }

                  final regex = RegExp(
                    r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^()\-_=+]).{8,}$',
                  );

                  if (!regex.hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter, one number, and one special character';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              AuthTextFormField(
                textInputAction: TextInputAction.next,
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock_outline),
                keyboardType: TextInputType.visiblePassword,
                autovalidateMode: _confirmPasswordTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (_) {
                  if (!_confirmPasswordTouched) {
                    setState(() {
                      _confirmPasswordTouched = true;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  }
                  if (value != _passwordController.text) {
                    return 'Confirm Password must match Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (bool value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Create Account',
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   if (!isTermsAccepted) {
                  //     buildErrorSnackBar(context, 'يجب قبول الشروط والأحكام');
                  //     return;
                  //   }
                  //   context.read<SignupCubit>().createUserWWithEmailAndPassword(
                  //     _emailController.text,
                  //     _passwordController.text,
                  //     _nameController.text,
                  //   );
                  //   Navigator.pushReplacementNamed(
                  //     context,
                  //     SigninView.routeName,
                  //   );
                  // }
                  final local8 = _extractLocalDigits(
                    _phoneController.text,
                  ); // 8 digits
                  final e164 = '+9627$local8'; // E.164 without spaces if needed
                },
              ),
              const SizedBox(height: 30),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
