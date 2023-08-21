import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/UI/view/theme/colors.dart';
import 'package:portafolio/UI/view/widgets/card_custom.dart';

class ProyectsView extends StatelessWidget {
  const ProyectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Center(
              child: Text(
            'Proyects',
            style: GoogleFonts.roboto(
                color: textColor, fontWeight: FontWeight.w700, fontSize: 50),
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        const Wrap(
          children: [
            CardProjects(
                titleProject: 'ChazaUNapp',
                urlImage: 'assets/chazaUNapp.webp',
                urlRepository: 'https://'),
            CardProjects(
                titleProject: 'AdminDashBoard',
                urlImage: 'assets/chazaUNapp.webp',
                urlRepository: 'https://'),
            CardProjects(
                titleProject: 'MrGarciaApp',
                urlImage: 'assets/chazaUNapp.webp',
                urlRepository: 'https://'),
            CardProjects(
                titleProject: 'ChazaUNapp',
                urlImage: 'assets/chazaUNapp.webp',
                urlRepository: 'https://'
            ),
          ],
        ),
      ],
    );
  }
}
