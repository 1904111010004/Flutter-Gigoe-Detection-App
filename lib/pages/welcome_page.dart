import 'package:flutter/material.dart';
import 'package:gigoe_detection_app/Pages/login_page.dart';
import 'package:gigoe_detection_app/Pages/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff8EA6E1),
              Color(0xff4FC0A6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo aplikasi
            Image.asset(
              'assets/images/logo.png', // Ganti dengan path gambar logo Anda
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            // Deskripsi
            const Text(
              'Aplikasi perhitungan indeks karies gigi DMF-T.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Teks Selamat Datang
            const Text(
              'Selamat Datang!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Tombol "Mulai"
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const RegisterPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xffCBE4DE),
                backgroundColor: const Color(0xff2E4F4F),
                minimumSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
              ),
              child: const Text(
                'Mulai',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol "Sudah Mempunyai Akun"
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xff2E4F4F),
                backgroundColor: const Color(0xFFFFFFFF),
                minimumSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
              ),
              child: const Text(
                'Sudah mempunyai akun',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
