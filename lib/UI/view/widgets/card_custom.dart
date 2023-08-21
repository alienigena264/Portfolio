import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../theme/colors.dart';

class CardProjects extends StatelessWidget {
  const CardProjects({
    Key? key,
    required this.titleProject,
    required this.urlImage,
    required this.urlRepository,
  }) : super(key: key);

  final String titleProject;
  final String urlImage;
  final String urlRepository;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: secundaryColor.withOpacity(0.4),
      child: Column(
        children: [
          BuildTitle(titleProject: titleProject),
          const SizedBox(height: 20),
          const BuildProjectImage(),
          const SizedBox(height: 20),
          BuildActionButtons(
            urlRepository: urlRepository,
            titleProject: titleProject,
            description:
                'Este proyecto tiene como base ayudar a mejorar la administracion de puestos de ventas dentro de la universidad brindando a los dueños una forma facil de encontrar trabajadores, y a los estudiantes una forma sencilla para generar unos ingresos extras durante sus huecos en la universidad',
          ),
        ],
      ),
    );
  }
}

class BuildTitle extends StatelessWidget {
  const BuildTitle({Key? key, required this.titleProject}) : super(key: key);

  final String titleProject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Text(
        titleProject,
        style: GoogleFonts.roboto(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }
}

class BuildProjectImage extends StatelessWidget {
  const BuildProjectImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class BuildActionButtons extends StatelessWidget {
  const BuildActionButtons(
      {Key? key,
      required this.urlRepository,
      required this.titleProject,
      required this.description})
      : super(key: key);

  final String urlRepository;
  final String titleProject;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://github.com/alienigena264/Portfolio');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          BuildTextButton(
              text: 'Ver Repositorio',
              onPressed: () {
                launchUrl(url);
              }),
          const SizedBox(width: 10),
          BuildElevatedButton(
              text: 'Ver Proyecto',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    //TODO: Agregar el url del video
                    return BuildAlertDialog(
                      description: description,
                      tittle: titleProject,
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}

class BuildTextButton extends StatelessWidget {
  const BuildTextButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(secundaryColor.withOpacity(0.5)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(secundaryColor),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}

class BuildAlertDialog extends StatelessWidget {
  const BuildAlertDialog({
    Key? key,
    required this.tittle,
    required this.description,
  }) : super(key: key);
  final String tittle;
  final String description;

  @override
  Widget build(BuildContext context) {
    double titleFontSize = MediaQuery.of(context).size.width < 500 ? 24 : 35;

    return AlertDialog(
      title: Text(
        tittle,
        style: TextStyle(fontSize: titleFontSize, color: primaryColor),
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PlayerCustomVideo(),
              const SizedBox(
                height: 20,
              ),
              Text(description,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  )),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: BuildElevatedButton(
                text: "Cerrar",
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ),
      ],
    );
  }
}

class PlayerCustomVideo extends StatelessWidget {
  PlayerCustomVideo({
    super.key,
  });

// If the requirement is just to play a single video.
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'JwsgCnBLL4A',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: backgroundColor, width: 0),
      ),
      child: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16 / 9,
      ),
    );
  }
}
