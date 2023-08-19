import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/UI/view/theme/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _DescriptionRow(),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }
}

class _DescriptionRow extends StatelessWidget {
  const _DescriptionRow();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: const _InitialText(),
        ),
        Expanded(child: Container()),
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.05),
          child: const _InitialPhoto(),
        )
      ],
    );
  }
}

class _InitialPhoto extends StatelessWidget {
  const _InitialPhoto();

  @override
  Widget build(BuildContext context) {
    return FadeInRightBig(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        padding: const EdgeInsets.only(right: 25),
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(360),
          border: Border.all(color: backgroundColor, width: 0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(360),
          child: Image.asset(
            'assets/Yo.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _InitialText extends StatelessWidget {
  const _InitialText();

  @override
  Widget build(BuildContext context) {
    return FadeInLeftBig(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HI',
            style: GoogleFonts.roboto(
                fontSize: 50, fontWeight: FontWeight.bold, color: textColor),
          ),
          GlitchEffect(
            colors:const  [Colors.green, auxColor,primaryColor],
            duration: const Duration(milliseconds: 2500),
            child: Text(
              'I\'m Juan Pablo Garcia',
              style: GoogleFonts.roboto(
                  fontSize: 50, fontWeight: FontWeight.bold, color: textColor),
            ),
          ),
          Text(
            'a mobile Developer',
            style: GoogleFonts.roboto(
                fontSize: 50, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}
