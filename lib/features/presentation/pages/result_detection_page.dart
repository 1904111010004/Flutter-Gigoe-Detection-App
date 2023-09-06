import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultDetectionPage extends StatefulWidget {
  const ResultDetectionPage({super.key});

  @override
  State<ResultDetectionPage> createState() => _ResultDetectionPageState();
}

class _ResultDetectionPageState extends State<ResultDetectionPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffCBE4DE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Text(
          "Hasil Deteksi",
          style: GoogleFonts.poppins(
              color: const Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xff2E4F4F),
                Color(0xff0E8388),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: const SizedBox(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CarouselSlider(
              items: const [
                // ResultDetectionCard(),
                // ResultDetectionCard(),
                // ResultDetectionCard(),
                // ResultDetectionCard(),
                // ResultDetectionCard(),
              ],
              options: CarouselOptions(
                height: height * 0.44,
                disableCenter: true,
                initialPage: 0,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultDetectionCard extends StatelessWidget {
  const ResultDetectionCard({
    super.key,
    this.cavity = 0,
    this.missingTooth = 0,
    this.filledTooth = 0,
    required this.resultImageCard,
  });

  final double cavity;
  final double missingTooth;
  final double filledTooth;
  final Widget resultImageCard;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: 320,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Gigi Depan",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                "PHOTO 1 OF 5",
                style: GoogleFonts.poppins(),
              )
            ],
          ),
          const SizedBox(height: 10),
          resultImageCard,
          const SizedBox(height: 10),
          Text(
            "Kondisi Gigi",
            style: GoogleFonts.poppins(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gigi Karies ",
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    "Gigi Hilang ",
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    "Gigi Tambal ",
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    ":  ",
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    ":  ",
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    ":  ",
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    cavity.toStringAsFixed(0),
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    missingTooth.toStringAsFixed(0),
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    filledTooth.toStringAsFixed(0),
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ResultImageCard extends StatelessWidget {
  const ResultImageCard({
    super.key,
    required this.height,
    required this.imageBytes,
  });

  final double height;
  final Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.22,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: imageBytes != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                imageBytes!,
                fit: BoxFit.cover,
              ),
            )
          : const SizedBox(),
    );
  }
}
