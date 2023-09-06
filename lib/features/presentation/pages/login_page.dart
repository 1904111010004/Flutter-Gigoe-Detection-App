import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Firebase/auth.dart';
import '../widgets/bottom_nav_bar.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff8EA6E1), Color(0xff4FC0A6)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'MASUK',
                    style: GoogleFonts.poppins(
                        color: const Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Alamat Email',
                      hintStyle: GoogleFonts.poppins(
                          color: const Color(0xffC3C3C3),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Kata Sandi',
                      hintStyle: GoogleFonts.poppins(
                          color: const Color(0xffC3C3C3),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff2E4F4F),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email.text.trim(),
                          password: password.text.trim(),
                        );
                        // Authentication successful, navigate to the home page or perform any desired actions
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BottomNavBar(),
                          ),
                        );
                      } catch (e) {
                        setState(() {
                          errorMessage = e.toString();
                        });
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Kesalahan',
                                    style: GoogleFonts.poppins(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Alamat Email dan Kata Sandi yang dimasukkan tidak valid!',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff0DAABC)),
                                    child: Text(
                                      'OK',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xffffffff),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Lanjutkan',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffffffff),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Belum mempunyai akun? ',
                        style: GoogleFonts.poppins(
                            color: const Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Daftar',
                        style: GoogleFonts.poppins(
                            color: const Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const RegisterPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
