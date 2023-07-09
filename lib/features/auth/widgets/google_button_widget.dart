import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class GoogleButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final double? width;

  const GoogleButtonWidget({
    super.key,
    required this.onTap,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.kRedColor, width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: width,
          height: 50,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: AppColors.kRedColor,
                ),
                Spacer(),
                Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: AppColors.kRedColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
