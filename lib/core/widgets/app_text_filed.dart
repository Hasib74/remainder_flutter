import 'package:filednote/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  String? hint;

  // String? label;
  String? errorText;
  bool? isPassword;
  TextEditingController? controller;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  Function? onFieldSubmitted;
  Function? onChanged;
  Function? onEditingComplete;
  Function? onTap;
  Function? onSaved;
  Function? validator;
  int? maxLines;
  int? minLines;
  bool? enabled;
  bool? readOnly;
  bool? obscureText;
  bool? autofocus;
  bool? autocorrect;
  bool? enableSuggestions;
  bool? showCursor;
  bool? maxLengthEnforced;
  int? maxLength;
  double? cursorWidth;
  double? cursorHeight;
  Radius? cursorRadius;
  Color? cursorColor;

  AppTextFiled(
      {super.key,
      this.hint,
      // this.label,
      this.errorText,
      this.isPassword,
      this.controller,
      this.textInputType,
      this.textInputAction,
      this.focusNode,
      this.onFieldSubmitted,
      this.onChanged,
      this.onEditingComplete,
      this.onTap,
      this.onSaved,
      this.validator,
      this.maxLines,
      this.minLines,
      this.enabled,
      this.readOnly,
      this.obscureText,
      this.autofocus,
      this.autocorrect,
      this.enableSuggestions,
      this.showCursor,
      this.maxLengthEnforced,
      this.maxLength,
      this.cursorWidth,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onChanged: onChanged as void Function(String)?,
      onEditingComplete: onEditingComplete as void Function()?,
      onTap: onTap as void Function()?,
      onSubmitted: onFieldSubmitted as void Function(String)?,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: AppColor.primaryTextColor,
        fontSize: 12,
      ),
      cursorColor: AppColor.primaryTextColor,
      decoration: InputDecoration(
        hintText: hint,
        errorText: errorText,
        focusColor: AppColor.primaryTextColor,
        fillColor: AppColor.primaryTextColor,
      ),
    );
  }
}
