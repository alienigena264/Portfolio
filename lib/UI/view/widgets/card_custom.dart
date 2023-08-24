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
    required this.description,
    required this.idVideo,
    required this.technologies,
  }) : super(key: key);

  final String titleProject;
  final String urlImage;
  final String urlRepository;
  final String description;
  final String idVideo;
  final List<String> technologies;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: secundaryColor.withOpacity(0.4),
      child: Column(
        children: [
          BuildTitle(titleProject: titleProject),
          const SizedBox(height: 20),
          BuildProjectImage(urlImage: urlImage,),
          const SizedBox(height: 20),
          BuildActionButtons(
            urlRepository: urlRepository,
            titleProject: titleProject,
            description: description,
            idVideo: idVideo,
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
  const BuildProjectImage({Key? key, required this.urlImage}) : super(key: key);
  final String urlImage;

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(urlImage, fit: BoxFit.fill)
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
      required this.description,
      required this.idVideo})
      : super(key: key);

  final String urlRepository;
  final String titleProject;
  final String description;
  final String idVideo;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(urlRepository);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          BuildTextButton(
              text: 'View repository',
              onPressed: () {
                launchUrl(url);
              }),
          const SizedBox(width: 10),
          BuildElevatedButton(
              text: 'View Project',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BuildAlertDialog(
                      description: description,
                      tittle: titleProject,
                      idVideo: idVideo,
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
    required this.idVideo,
  }) : super(key: key);
  final String tittle;
  final String description;
  final String idVideo;

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
              PlayerCustomVideo(
                idVideo: idVideo,
              ),
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
                text: "Close",
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
  const PlayerCustomVideo({
    super.key,
    required this.idVideo,
  });
  final String idVideo;

  @override
  Widget build(BuildContext context) {
    // If the requirement is just to play a single video.
  final controller = YoutubePlayerController.fromVideoId(
    videoId: idVideo,
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

    return Container(
      width: 500,
      height: 300,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: backgroundColor, width: 0),
      ),
      child: YoutubePlayer(
        controller: controller,
        aspectRatio: 16 / 9,
      ),
    );
  }
}
