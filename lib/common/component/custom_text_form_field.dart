import 'package:flutter/material.dart';
import 'package:actual/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  const CustomTextFormField(
      {required this.onChanged,
      this.hintText,
      this.errorText,
      this.obscureText = false,
      this.autofocus = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: INPUT_BORDER_COLOR,
      width: 1.0,
    ));
    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      autofocus: autofocus,
      obscureText: obscureText, // 비밀번호
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: const TextStyle(color: BODY_TEXT_COLOR, fontSize: 14.0),
        // errorText: errorText,
        fillColor: INPUT_BG_COLOR,
        filled: true,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
