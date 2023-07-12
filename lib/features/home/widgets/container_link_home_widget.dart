import 'package:betweener/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListT extends StatelessWidget {
  const ListT({
    required this.title,
   required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.newOrEditLink);
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 15),
        width: 116,
        height: 79,
        decoration: BoxDecoration(
            color: Color(0xffFFE6A6), borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                  color: Color(0xff784E00),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: GoogleFonts.roboto(
                  color: Color(0xff784E00),
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
