import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class CardProyects extends StatelessWidget {
  const CardProyects(this.titleProyect, this.urlImage, this.urlRepository, {super.key});
  final String titleProyect;
  final String urlImage;
  final String urlRepository;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: secundaryColor.withOpacity(0.4),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8),
            child: Text(
              titleProyect,
              style: GoogleFonts.roboto(
                  color: textColor, fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: 200,
              height: 240,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: backgroundColor, width: 0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(secundaryColor.withOpacity(0.5)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Ver Repositorio',
                      style: GoogleFonts.roboto(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(secundaryColor)),
                    onPressed: () {},
                    child: Text(
                      'Ver Proyecto',
                      style: GoogleFonts.roboto(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
