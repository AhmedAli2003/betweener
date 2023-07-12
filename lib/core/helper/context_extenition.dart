import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ContextExtexnstion on BuildContext {
  void showSnackBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: GoogleFonts.poppins(),
      ),
      backgroundColor: error ? Colors.red.shade500 : Colors.green.shade500,
    ));
  }
}
