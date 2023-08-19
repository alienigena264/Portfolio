import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/UI/view/theme/colors.dart';
import 'package:portafolio/UI/view/widgets/card_custom.dart';

class ProyectsView extends StatelessWidget {
  const ProyectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
        const Wrap(
                children: [
                  CardProyects('ChazaUNapp', 'assets/chazaUNapp.webp', 'https://'),
                  CardProyects(
                      'Admin DashBoard', 'assets/chazaUNapp.webp', 'https://'),
                  CardProyects('MrGarciaApp', 'assets/chazaUNapp.webp', 'https://'),
                  CardProyects('ChazaUNapp', 'assets/chazaUNapp.webp', 'https://'),
                ],
              
        ),
      ],
    );
  }
}