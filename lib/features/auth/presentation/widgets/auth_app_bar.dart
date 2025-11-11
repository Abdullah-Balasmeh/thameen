import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

AppBar buildAppBar(
  BuildContext context,
  bool showButton, {
  required String title,
  VoidCallback? onPressed,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: showButton
        ? IconButton(
            style: TextButton.styleFrom(
              elevation: 10,
              foregroundColor: AppColors.black,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Color(0xffF1F1F5),
                  width: 1,
                ),
              ),
            ),
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_back_ios_new),
          )
        : null,
    title: Text(
      title,
      style: AppTextStyle.bold18.copyWith(color: AppColors.black),
    ),
    centerTitle: true,
  );
}
