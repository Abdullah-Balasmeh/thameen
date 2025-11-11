import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class AuthPhoneTextFormField extends StatefulWidget {
  const AuthPhoneTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
    this.textInputAction,
    this.prefixIcon,
    this.inputFormatters = const <TextInputFormatter>[],
    this.prefix = '+962 7 ',
  });

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;

  /// The fixed, unremovable prefix (default '+962 7 ')
  final String prefix;

  /// Additional formatters (your JordanPhoneFormatter should be included here)
  final List<TextInputFormatter> inputFormatters;

  @override
  State<AuthPhoneTextFormField> createState() => _AuthPhoneTextFormFieldState();
}

class _AuthPhoneTextFormFieldState extends State<AuthPhoneTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Make sure the field always starts with the prefix.
    if (!widget.controller.text.startsWith(widget.prefix)) {
      widget.controller.text = widget.prefix;
      widget.controller.selection = TextSelection.collapsed(
        offset: widget.controller.text.length,
      );
    }

    _focusNode.addListener(() {
      // If the caret ever slips into the prefix (e.g., via click),
      // push it to just after the prefix.
      if (_focusNode.hasFocus) {
        final sel = widget.controller.selection.start;
        if (sel < widget.prefix.length) {
          widget.controller.selection = TextSelection.collapsed(
            offset: widget.controller.text.length,
          );
        }
      }
      setState(() {});
    });
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
      inputFormatters: widget.inputFormatters,
      onTap: () {
        // Prevent placing the caret inside the prefix
        final sel = widget.controller.selection.start;
        if (sel < widget.prefix.length) {
          widget.controller.selection = TextSelection.collapsed(
            offset: widget.controller.text.length,
          );
        }
      },
      style: AppTextStyle.semiBold18.copyWith(color: AppColors.black),
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: AppTextStyle.semiBold14.copyWith(color: AppColors.red),
        iconColor: isFocused ? AppColors.primary : AppColors.black,
        suffixIconColor: isFocused ? AppColors.primary : AppColors.black,
        prefixIconColor: isFocused ? AppColors.primary : AppColors.black,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.bold14.copyWith(
          color: isFocused ? AppColors.primary : AppColors.black,
        ),
        filled: true,
        fillColor: AppColors.white,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildFocusedBorder(),
        errorBorder: _buildErrorBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.white, width: 2),
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    );
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.red, width: 1),
    );
  }
}
