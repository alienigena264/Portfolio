import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/UI/view/theme/colors.dart';
import 'package:portafolio/UI/view/widgets/titles_custom.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    bool mobileMode = false;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 450) {
      mobileMode = true;
    } else {
      mobileMode = false;
    }
    return FadeInLeftBig(
      duration: const Duration(milliseconds: 1000),
      child: _Atributes(
        mobileMode: mobileMode,
        screenWidth: screenWidth,
        cros: CrossAxisAlignment.start,
      ),
    );
  }
}

class _Atributes extends StatelessWidget {
  const _Atributes({
    required this.mobileMode,
    required this.screenWidth,
    required this.cros,
  });
  final CrossAxisAlignment cros;
  final bool mobileMode;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: cros,
      children: [
        TittlesCustom(text: 'About Me', mobileMode: mobileMode),
        Padding(
          padding: mobileMode
              ? const EdgeInsets.symmetric(horizontal: 10)
              : const EdgeInsets.symmetric(horizontal: 50.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.5),
              child: Text(
                  'I am a mobile developer, I have experience in the development of mobile applications with Flutter, I have knowledge in the development of web applications with Angular and I have knowledge in the development of backend with Nodejs',
                  style: GoogleFonts.roboto(color: textColor, fontSize: 20)),
            ),
          ),
        ),
      ],
    );
  }
}
