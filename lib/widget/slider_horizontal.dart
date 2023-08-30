import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> horizontalImages = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Start the timer to auto-scroll
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 5), () {
      if (_currentPage < horizontalImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _startAutoScroll(); // Continue the loop
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xffCBE4DE),
        ),
        Container(
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
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
        Positioned(
          top: 100,
          left: 20,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Halo, ',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'drg. Subhan Janura',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: Image.asset(
            'assets/images/appbar_logo.png',
            height: 40,
            width: 130,
          ),
        ),
        Positioned(
          top: 90,
          right: 20,
          child: Row(
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                color: Color(0xffCBE4DE),
                size: 30,
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/icons/icon_profile.png',
                height: 40,
                width: 40,
              ),
            ],
          ),
        ),
        Positioned(
          top: 200,
          left: 10,
          right: 10,
          child: SizedBox(
            height: 150,
            width: 300,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: horizontalImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Image.asset(
                    horizontalImages[index],
                    height: 150,
                    width: 300,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 400,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data Statistik',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2E4F4F),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Hasil perhitungan indeks DMF-T dalam bentuk',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2E4F4F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                ' grafik. Indikator:',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2E4F4F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '1. Jumlah total gigi berdasarkan DMF.',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2E4F4F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '2. Jumlah pasien, wilayah dan jenis kelamin.',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2E4F4F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
