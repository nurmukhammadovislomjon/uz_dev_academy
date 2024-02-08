import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/oqish/kursni_oqish_page.dart';
import 'package:uz_dev_academy/list/barcha_kurslar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoKorishPage extends StatefulWidget {
  const VideoKorishPage({super.key, required this.index, required this.author});
  final int index;
  final int author;
  @override
  State<VideoKorishPage> createState() => _VideoKorishPageState();
}

class _VideoKorishPageState extends State<VideoKorishPage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: okCoursesUrl[widget.index],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: false,
        hideThumbnail: false,
        forceHD: true,
        controlsVisibleAtStart: true,
        useHybridComposition: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            YoutubePlayer(controller: youtubePlayerController,width: double.maxFinite,),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              "${widget.index}. ${okCoursesTitle[widget.index]}",
              style: GoogleFonts.poppins(color: whiteColor, fontSize: 22),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                barchakursauthor[widget.author],
                style: GoogleFonts.poppins(color: whiteColor, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(
                color: redColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    "Orqaga qaytish",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
