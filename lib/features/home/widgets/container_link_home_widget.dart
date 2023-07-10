import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListT extends StatelessWidget {
  const ListT({
    this.color,
    required this.title,
    this.colorTitle = const Color(0xff784E00),
    this.icon,
    this.subtitle ='@ahmed',
    this.size = 16,
    this.fontWeight =FontWeight.w300,
    super.key,
  });

  final Color? color;
  final String? title;
  final String? subtitle;
  final Color? colorTitle ;
  final double ? size ;
  final Widget? icon;
final FontWeight ? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 15),
      width: 116,
      height: 79,
      decoration:
          BoxDecoration(color: color!, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? '',
            style: GoogleFonts.roboto(
                color:  colorTitle,
                fontSize: size,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle!,
            style: GoogleFonts.roboto(
                color: colorTitle,
                fontSize: 13,
                fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
