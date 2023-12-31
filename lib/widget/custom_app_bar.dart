import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            // Posisi Custom AppBar
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                  colors: [Color(0xFF2E4F4F), Color(0xFF0E8388)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    // Posisi Logo dalam Custom AppBar
                    top: 50,
                    left: 20,
                    child: Image.asset(
                      'assets/images/appbar_logo.png',
                      width: 130,
                      height: 40,
                    ),
                  ),
                  Positioned(
                    // Posisi Teks dalam Custom AppBar
                    bottom: 20,
                    left: 20,
                    child: Center(
                      child: RichText(
                        // Custom Teks
                        text: TextSpan(
                          text: 'Halo, ',
                          style: GoogleFonts.poppins(
                              color: const Color(0xffffffff),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: 'Subhan Janura',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // Posisi Icon Profil Pengguna
                    bottom: 10,
                    right: 10,
                    child: Image.asset(
                      'assets/icons/icon_profile.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const Positioned(
                    // Posisi Icon Notifikasi
                    bottom: 10,
                    right: 70,
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 35,
                      color: Color(0xFFCBE4DE),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
