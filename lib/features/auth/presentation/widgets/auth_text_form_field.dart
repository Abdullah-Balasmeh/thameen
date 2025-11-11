import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
    required this.keyboardType,
    @required this.validator,
    required this.controller,
    @required this.autovalidateMode,
    @required this.onChanged,
    @required this.textInputAction,
  });

  final String hintText;
  final bool obscureText;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  final FocusNode _focusNode = FocusNode();

  bool showPassword = false;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // rebuild when focus changes
    });
    showPassword = !widget.obscureText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _focusNode.hasFocus;

    return TextFormField(
      cursorColor: AppColors.primary,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText && !showPassword,
      obscuringCharacter: '●', // '⬤'
      style: AppTextStyle.semiBold18.copyWith(
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: AppTextStyle.semiBold14.copyWith(
          color: AppColors.red,
        ),
        iconColor: isFocused ? AppColors.primary : AppColors.black,
        suffixIconColor: isFocused ? AppColors.primary : AppColors.black,
        prefixIconColor: isFocused ? AppColors.primary : AppColors.black,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.bold14.copyWith(
          color: isFocused ? AppColors.primary : AppColors.black,
        ),
        filled: true,
        fillColor: AppColors.white,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
        errorBorder: buildErrorBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: AppColors.white,
        width: 2,
      ),
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 2,
      ),
    );
  }

  OutlineInputBorder buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: AppColors.red,
        width: 1,
      ),
    );
  }
}
