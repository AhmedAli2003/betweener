import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final double? width;
  final String text;

  const PrimaryOutlinedButtonWidget(
      {super.key,
      required this.onTap,
      this.width = double.infinity,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.kPrimaryColor, width: 2)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: width,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
