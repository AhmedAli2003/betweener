import 'package:betweener/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/container_link_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Text(
            'Hello, Ahmed!',
            style: GoogleFonts.roboto(fontSize: 28, color: const Color(0xff2D2B4E), fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          AppAssets.qrImage,
          color: const Color(0xff2D2B4E),
          height: 180,
          width: double.infinity,
        ),
        const SizedBox(
          height: 50,
        ),
        const Divider(
          color: Colors.black,
          indent: 80,
          endIndent: 80,
          thickness: 2.5,
        ),
        const SizedBox(
          height: 40,
        ),
        ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              children: const [
                ListT(
                  color: Color(0xffFFE6A6),
                  title: 'FACEBOOK',
                ),
                ListT(
                  color: Color(0xffFFE6A6),
                  title: 'INSTAGRAM',
                ),
                ListT(
                  color: Color(0xffE7E5F1),
                  title: '+',
                  subtitle: 'Add More',
                  size: 32,
                  colorTitle: Color(0xff2D2B4E),
                  fontWeight: FontWeight.w600,
                  
                ),
              ],
            )),
      ],
    );
  }
}
