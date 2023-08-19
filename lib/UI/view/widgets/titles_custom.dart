import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class TittlesCustom extends StatelessWidget {
  const TittlesCustom({
    super.key,
    required this.mobileMode, required this.text,
  });

  final String text;
  final bool mobileMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: mobileMode
          ? const EdgeInsets.symmetric(horizontal: 10.0)
          : const EdgeInsets.symmetric(horizontal: 50.0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(text,
            style: GoogleFonts.roboto(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 50)),
      ),
    );
  }
}