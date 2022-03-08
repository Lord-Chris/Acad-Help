import 'package:flutter/material.dart';

import '../constants/_constants.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final Widget? prefix;
  final bool readOnly;
  final bool expands;
  final int? minLines, maxLines, maxLength;
  final bool enabled;

  AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.obscureText = false,
    this.prefix,
    this.initialValue,
    this.readOnly = false,
    this.expands = false,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.enabled = true,
  })  : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: AppColors.main,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      readOnly: readOnly,
      expands: expands,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      style: const TextStyle(
        color: AppColors.main,
        fontSize: 20,
        fontWeight: FontWeight.normal,
        fontFamily: 'GTWalsheimPro',
      ),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: suffix,
        prefixIcon: prefix,
        filled: true,
        enabled: enabled,
        fillColor: enabled ? AppColors.white : AppColors.main.withOpacity(0.4),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.main.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.main.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.main.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        labelStyle: const TextStyle(
          color: AppColors.main,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'GTWalsheimPro',
        ),
        hintStyle: const TextStyle(
          color: AppColors.main,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'GTWalsheimPro',
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 2,
          ),
        ),
      ),
    );
  }
}
