// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/UI/view/about_view.dart';
import 'package:portafolio/UI/view/proyects_view.dart';
import 'package:portafolio/UI/view/theme/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key, required this.child});
  final Widget child;

  @override
  HomeLayoutState createState() => HomeLayoutState();
}

class HomeLayoutState extends State<HomeLayout> {
  bool showActions = true;
  bool showAnimated = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 830) {
      showActions = false;
    } else {
      showActions = true;
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [backgroundColor, primaryColor],
          stops: [0.3, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: backgroundColor,
            elevation: 0,
            actions: showActions
                ? [
                    _AppBarButtoms(
                      onPressed: () {},
                      text: 'About Me',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    _AppBarButtoms(
                      onPressed: () {},
                      text: 'Proyects',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    _AppBarButtoms(
                      onPressed: () {},
                      text: 'Skills',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    _AppBarButtoms(
                      onPressed: () {},
                      text: 'Contact',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          showAnimated = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          if (screenWidth >= 830) {
                            showActions =
                                true; // Solo establecer showActions en true en pantallas grandes.
                          }
                          showAnimated = false; // Ocultar la animación.
                          print('das');
                        });
                      },
                      child: showAnimated
                          ? ElasticIn(child: const _ButtomCV())
                          : const _ButtomCV(),
                    )
                  ]
                : [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            showActions = true;
                          });
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: textColor,
                        )),
                  ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                widget.child,
                
                const AboutView(),
                const SizedBox(
            height: 50,
          ),
          
                const ProyectsView()
          
              ],
            ),
          )),
    );
  }
}

class _ButtomCV extends StatelessWidget {
  const _ButtomCV();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(auxColor.withAlpha(155)),
          overlayColor: MaterialStateProperty.all(primaryColor),
        ),
        onPressed: () {},
        child: Text(
          'View CV',
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

class _AppBarButtoms extends StatelessWidget {
  const _AppBarButtoms({
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => {
        print('enter'),
      },
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(primaryColor),
        ),
        onPressed: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
