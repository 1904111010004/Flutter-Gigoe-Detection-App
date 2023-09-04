import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBE4DE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Text(
          "Panduan Penggunaan",
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
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          CarouselSlider(
            items: [
              _buildPhotoSlide(
                  "Foto 1 - Gigi Depan", "assets/images/gigi_depan.JPG"),
              _buildPhotoSlide(
                  "Foto 2 - Gigi Kanan", "assets/images/gigi_kanan.JPG"),
              _buildPhotoSlide(
                  "Foto 3 - Gigi Kiri", "assets/images/gigi_kiri.JPG"),
              _buildPhotoSlide(
                  "Foto 4 - Gigi Atas", "assets/images/gigi_atas.JPG"),
              _buildPhotoSlide(
                  "Foto 5 - Gigi Bawah", "assets/images/gigi_bawah.JPG")
            ],
            options: CarouselOptions(
              height: 340,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  '1. Buka mulut pasien dengan lebar seperti pada contoh diatas!\n2. Arahkan kamera ke mulut pasien.\n3. Tekan layar atau tekan tombol volume untuk mengambil foto.',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPhotoSlide(
  String title,
  String assetPath,
) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: const Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(assetPath),
            ),
          ),
        ),
      ],
    ),
  );
}
