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
              urlImage:
                  'https://images.unsplash.com/photo-1550330562-b055aa030d73?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFyZ2UlMjBmb3JtYXR8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
              urlRepository: 'https://github.com/alienigena264/chazaUNApp',
              description:
                  'Esta es una aplicacion para la universidad nacional de colombia, en la cual se puede ver el horario de clases, el horario de los buses, el mapa de la universidad, entre otras cosas',
              idVideo: 'uyS-WL_ln84',
              technologies: ['Flutter', 'FireStore'],
            ),
            CardProjects(
              titleProject: 'AdminDashBoard',
              urlImage:
                  'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZnJlZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
              urlRepository: 'https://github.com/alienigena264/DashBoardWeb',
              description:
                  'Panel de administracion de multiples valores que corresponde a la logistica de la empresa',
              idVideo: '1wC8z_UlLGI',
              technologies: ['Flutter Web'],
            ),
            CardProjects(
              titleProject: 'MrGarciaApp',
              urlImage:
                  'https://images.unsplash.com/photo-1550330562-b055aa030d73?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFyZ2UlMjBmb3JtYXR8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
              urlRepository: 'https://github.com/alienigena264/Mr.Garcia',
              description:
                  'Es la aplicacion para una barberia en la que se pueden ver todas las sedes del negocio y agendar citas en horarios especificos',
              idVideo: 'E6k179JEUzI',
              technologies: [],
            ),
            CardProjects(
              titleProject: 'Angular',
              urlImage:
                  'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZnJlZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
              urlRepository: 'https://github.com/alienigena264/Angular',
              description:
                  'Esta es una aplicacion para la universidad nacional de colombia, en la cual se puede ver el horario de clases, el horario de los buses, el mapa de la universidad, entre otras cosas',
              idVideo: 'SG3dSWd5t6c',
              technologies: ['Flutter', 'Angular'],
            ),
          ],
        ),
      ],
    );
  }
}
