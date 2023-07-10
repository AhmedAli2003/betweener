import 'package:betweener/core/theme/styles.dart';
import 'package:flutter/material.dart';

class PrimaryLabeledTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool password;
  final TextInputType? keyboardType;
  final void Function()? onEditingComplete;
  const PrimaryLabeledTextFieldWidget({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.password = false,
    this.keyboardType,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.textStyle14,
        ),
        const SizedBox(
          height: 12,
        ),
        TextField(
          onEditingComplete: onEditingComplete,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: password,
          enableSuggestions: password == true ? false : true,
          autocorrect: password == true ? false : true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            hintText: hint,
            border: Styles.primaryRoundedOutlineInputBorder,
            focusedBorder: Styles.primaryRoundedOutlineInputBorder,
            enabledBorder: Styles.primaryRoundedOutlineInputBorder,
            disabledBorder: Styles.primaryRoundedOutlineInputBorder,
          ),
        ),
      ],
    );
  }
}
